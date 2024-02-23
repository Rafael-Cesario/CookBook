require 'rails_helper'

RSpec.describe 'Lists', type: :request do
  let(:user) { User.create(
    email: Faker::Internet.email,
    name: Faker::Name.first_name,
    password: Faker::Internet.password(min_length: 10)
  )}

  describe 'Create' do
    it 'Validates presence of fields' do
      fields = { user_id: '', title: '' }
      post '/api/list', params: { list: fields }
      fields.keys.each { |key| expect(json[key.to_s]).to include("can't be blank") }
    end

    it 'Validates length of title' do
      title =  Faker::Lorem.characters(number: 101)
      post '/api/list', params: { list: { user_id: '123', title: } }
      expect(json['title']).to eq(['is too long (maximum is 100 characters)'])
    end

    it 'Raises an error due to user not found' do
      user_id = Faker::Internet.uuid
      post '/api/list', params: { list: { user_id:, title: 'Desserts' } }
      expect(json['user']).to eq(['must exist'])
    end

    it 'Creates a new list' do
      params = { list: { user_id: user[:id], title: 'Desserts' } }
      post '/api/list', params: params
      expected = { id: a_kind_of(String), user_id: user[:id], title: params[:list][:title] }
      expect(json.symbolize_keys).to include(expected)
    end
  end
end
