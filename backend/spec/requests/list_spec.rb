require 'rails_helper'

RSpec.describe 'Lists', type: :request do
  user_data = FakeDataHelper::FakeData.user

  let!(:user) { User.create(**user_data)}
  let(:headers) { authorization_header(user_data) }

  describe 'Create' do
    it 'Validates presence of fields' do
      fields = { user_id: '', title: '' }
      post '/api/list', params: { list: fields }, headers: headers
      fields.keys.each { |key| expect(json[key.to_s]).to include("can't be blank") }
    end

    it 'Validates length of title' do
      title =  Faker::Lorem.characters(number: 101)
      post '/api/list', params: { list: { user_id: '123', title: } }, headers: headers
      expect(json['title']).to eq(['is too long (maximum is 100 characters)'])
    end

    it 'Raises an error due to user not found' do
      user_id = Faker::Internet.uuid
      post '/api/list', params: { list: { user_id:, title: 'Desserts' } }, headers: headers
      expect(json['user']).to eq(['must exist'])
    end

    it 'Creates a new list' do
      params = { list: { user_id: user[:id], title: 'Desserts' } }
      post '/api/list', params: params, headers: headers
      expected = { id: a_kind_of(String), user_id: user[:id], title: params[:list][:title] }
      expect(json.symbolize_keys).to include(expected)
    end
  end

  describe 'Authorization header' do
    it 'Raises an error due to empty authorization header' do
      post "/api/list"
      expect(json).to eq({ "message" => "Requires authentication" })
    end

    it 'Raises and error due to malformed header' do
      post "/api/list", headers: { "Authorization" => "not_valid"}
      expect(json).to include( "error" => "invalid_request" )
    end

    it 'Raises and error due to invalid scheme' do
      post "/api/list", headers: { "Authorization" => "not_valid #{Faker::Lorem.characters(number: 100)}"}
      expect(json).to eq({ "message" => "Bad credentials" })
    end

    it 'Raises and error due to invalid token' do
      post "/api/list", headers: { "Authorization" => "Bearer #{Faker::Lorem.characters(number: 100)}"}
      expect(json).to eq({ "errors" => ["authorization: Invalid credentials"] })
    end

  end
end
