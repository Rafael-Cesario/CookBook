require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  let(:user) { User.create(email: 'user01@email.com', name: 'user01', password: 'Password123') }
  let(:list) { List.create(user_id: user[:id], title: 'List 01') }

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
      post '/recipe', params: { recipe: { list_id: '123' }}
      expect(json['errors']).to include('list'=> include('must exist'))
    end

    it 'Creates a new recipe' do
      recipeData = {
        list_id: list[:id],
        title: 'Cake',
        ingredients: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris eu',
        instructions: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris eu.',
        cooking_time: '40 minutes'
      }

      post '/recipe', params: { recipe: recipeData }
      recipe = Recipe.first

      expect(json).to include(recipeData.stringify_keys)
      expect(recipe).to have_attributes(recipeData)
    end
  end
end
