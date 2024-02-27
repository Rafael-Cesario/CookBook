require 'rails_helper'

RSpec.describe "Api::Recipes", type: :request do
  user_data = FakeDataHelper::FakeData.user
  list_data = FakeDataHelper::FakeData.list
  recipe_data = FakeDataHelper::FakeData.recipe

  let!(:user) { User.create user_data }
  let(:list) { List.create list_data.merge({ user_id: user[:id] })}
  let(:headers) { authorization_header(user_data) }

  describe 'Create' do
    it 'Validates the presence of fields' do
      fields = { title: "", ingredients: "", instructions: "", cooking_time: "", list_id: "" }
      params = { recipe: fields }
      post '/api/recipe', headers: headers, params: params
      fields.keys.each { |key| expect(json[key.to_s]).to include("can't be blank") }
    end

    it 'Validates the length of title' do
      data = recipe_data.merge({ title: Faker::Lorem.characters(number: 101), list_id: list[:id] })
      params = { recipe: data }
      post '/api/recipe', headers: headers, params: params
      expect(json["title"]).to eq(["is too long (maximum is 100 characters)"])
    end

    it 'Can not create a recipe without a list' do
      params = { recipe: recipe_data }
      post '/api/recipe', headers: headers, params: params
      expect(json["list"]).to eq(["must exist"])
    end

    it 'Returns a new recipe' do
      params = { recipe: recipe_data.merge({ list_id: list[:id] })}
      post '/api/recipe', headers: headers, params: params
      expect(json.symbolize_keys).to include(recipe_data)
    end

    it 'Creates a recipe on database' do
      params = { recipe: recipe_data.merge({ list_id: list[:id] })}
      post '/api/recipe', headers: headers, params: params
      recipe = Recipe.first
      expect(recipe.attributes.symbolize_keys).to include(recipe_data)
    end

  end
end
