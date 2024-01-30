require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  let(:user) { User.create(email: 'user01@email.com', name: 'user01', password: 'Password123') }
  let(:list) { List.create(user_id: user[:id], title: 'List 01') }

  recipeData = {
    title: 'Cake',
    ingredients: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris eu',
    instructions: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris eu.',
    cooking_time: '40 minutes'
  }

  describe 'Post /create' do
    it 'Raises an error due to blank params' do
      post '/recipe', params: { recipe: { list_id: list[:id] } }

      expect(json['errors']).to include(
        'title' => include("can't be blank"),
        'ingredients' => include("can't be blank"),
        'instructions' => include("can't be blank"),
        'cooking_time' => include("can't be blank")
      )
    end

    it 'Raises an error if list does not exist' do
      post '/recipe', params: { recipe: { list_id: '123' } }
      expect(json['errors']).to include('list' => include('must exist'))
    end

    it 'Creates a new recipe' do
      post '/recipe', params: { recipe: recipeData.merge({ list_id: list[:id] }) }
      recipe = Recipe.first

      expect(json).to include(recipeData.stringify_keys)
      expect(recipe).to have_attributes(recipeData)
    end
  end

  describe 'GET /index' do
    it 'Returns an empty array when list is not found' do
      get '/recipe?list_id=123'
      expect(json).to eq({ recipes: [], total: 0 }.stringify_keys)
    end

    it 'Returns an empty array if user has zero recipes' do
      get "/recipe?list_id=#{list[:id]}"
      expect(json).to eq({ recipes: [], total: 0 }.stringify_keys)
    end

    it 'Returns all the recipes' do
      total = 5
      total.times do |i|
        Recipe.create(recipeData.merge({ title: "Recipe 0#{i}", list_id: list[:id] }))
      end

      get "/recipe?list_id=#{list[:id]}"
      expect(json).to eq({ recipes: Recipe.all.as_json, total: }.stringify_keys)
    end
  end
end
