require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  recipe_data = {
    title: 'Cake',
    ingredients: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris eu',
    instructions: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris eu.',
    cooking_time: '40 minutes'
  }

  let(:user) { User.create(email: 'user01@email.com', name: 'user01', password: 'Password123') }
  let(:list) { List.create(user_id: user[:id], title: 'List 01') }
  let(:recipe) { Recipe.create(recipe_data.merge({ list_id: list[:id] }))}

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
      post '/recipe', params: { recipe: recipe_data.merge({ list_id: list[:id] }) }
      recipe = Recipe.first

      expect(json).to include(recipe_data.stringify_keys)
      expect(recipe).to have_attributes(recipe_data)
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
        Recipe.create(recipe_data.merge({ title: "Recipe 0#{i}", list_id: list[:id] }))
      end

      get "/recipe?list_id=#{list[:id]}"
      expect(json).to eq({ recipes: Recipe.all.as_json, total: }.stringify_keys)
    end
  end

  describe 'PATCH /update' do
    it 'Raises an error due to recipe not found' do
      patch "/recipe/123"
      expect(json['errors']).to include('notFound: Recipe was not found')
    end

    it 'Returns an error due to invalid parameters' do
      patch "/recipe/#{recipe[:id]}", params: recipe_data.merge({title: ''})
      expect(json['errors']).to include('title'=> include("can't be blank"))
    end

    it 'Update and save a recipe' do
      title = 'Carrot cake'
      patch "/recipe/#{recipe[:id]}", params: recipe_data.merge({title:})
      expect(json['title']).to eq(title)
      expect(Recipe.find_by_id(recipe[:id])['title']).to eq(title)
    end
  end

  describe 'DELETE /destroy' do
    it 'Raises an error due to recipe not found' do
      delete "/recipe/123"
      expect(json['errors']).to eq(['notFound: Recipe id not found'])
    end

    it 'Delete a recipe' do
      recipe = Recipe.create(
        list_id: list[:id],
        title: "Pudim",
        ingredients: "Lorem",
        instructions: "Lorem",
        cooking_time: "40 minutes"
      )

      delete "/recipe/#{recipe[:id]}"
      expect(json['message']).to include("Success: #{recipe.title} deleted with success.")
      expect(Recipe.all.length).to be(0)
    end
  end
end
