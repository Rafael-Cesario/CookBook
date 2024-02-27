require 'rails_helper'

RSpec.describe 'Api::Recipes', type: :request do
  user_data = FakeDataHelper::FakeData.user
  list_data = FakeDataHelper::FakeData.list
  recipe_data = FakeDataHelper::FakeData.recipe

  let!(:user) { User.create user_data }
  let(:list) { List.create list_data.merge({ user_id: user[:id] }) }
  let(:headers) { authorization_header(user_data) }

  describe 'Create' do
    it 'Validates the presence of fields' do
      fields = { title: '', ingredients: '', instructions: '', cooking_time: '', list_id: '' }
      params = { recipe: fields }
      post('/api/recipe', headers:, params:)
      fields.keys.each { |key| expect(json[key.to_s]).to include("can't be blank") }
    end

    it 'Validates the length of title' do
      data = recipe_data.merge({ title: Faker::Lorem.characters(number: 101), list_id: list[:id] })
      params = { recipe: data }
      post('/api/recipe', headers:, params:)
      expect(json['title']).to eq(['is too long (maximum is 100 characters)'])
    end

    it 'Can not create a recipe without a list' do
      params = { recipe: recipe_data }
      post('/api/recipe', headers:, params:)
      expect(json['list']).to eq(['must exist'])
    end

    it 'Returns a new recipe' do
      params = { recipe: recipe_data.merge({ list_id: list[:id] }) }
      post('/api/recipe', headers:, params:)
      expect(json.symbolize_keys).to include(recipe_data)
    end

    it 'Creates a recipe on database' do
      params = { recipe: recipe_data.merge({ list_id: list[:id] }) }
      post('/api/recipe', headers:, params:)
      recipe = Recipe.first
      expect(recipe.attributes.symbolize_keys).to include(recipe_data)
    end
  end

  describe 'Authorization headers' do
    methods = { post: '/api/recipe' }
    invalid_token = Faker::Lorem.characters(number: 100)

    it 'Raises an error due to empty authorization header' do
      methods.each do |method, url|
        send(method, url)
        expect(json).to eq({ 'message' => 'Requires authentication' })
      end
    end

    it 'Raises and error due to malformed header' do
      methods.each do |method, url|
        send(method, url, headers: { 'Authorization' => 'not_valid' })
        expect(json).to include('error' => 'invalid_request')
      end
    end

    it 'Raises and error due to invalid scheme' do
      methods.each do |method, url|
        send(method, url, headers: { 'Authorization' => "not_valid #{invalid_token}" })
        expect(json).to eq({ 'message' => 'Bad credentials' })
      end
    end

    it 'Raises and error due to invalid token' do
      methods.each do |method, url|
        send(method, url, headers: { 'Authorization' => "Bearer #{invalid_token}" })
        expect(json).to eq({ 'errors' => ['authorization: Invalid credentials'] })
      end
    end
  end
end
