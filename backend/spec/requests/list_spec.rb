require 'rails_helper'

RSpec.describe 'Lists', type: :request do
  user_data = FakeDataHelper::FakeData.user

  let!(:user) { User.create(**user_data)}

  let(:token) do
    params = { authentication: { email: user_data[:email], password: user_data[:password] }}
    post "/api/authentication", params: params
    json["token"]
  end

  def headers() = { "Authorization" => "Bearer #{token}" }

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
end
