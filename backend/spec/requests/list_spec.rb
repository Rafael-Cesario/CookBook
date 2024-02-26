require 'rails_helper'

RSpec.describe 'Lists', type: :request do
  user_data = FakeDataHelper::FakeData.user
  list_data = FakeDataHelper::FakeData.list

  let!(:user) { User.create user_data }
  let(:list) { List.create list_data.merge({ user_id: user[:id] })}
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

  describe 'Get' do
    it 'Returns an empty array when there is not lists created' do
      get "/api/list?user_id=#{user[:id]}", headers: headers
      expect(json.symbolize_keys).to eq({ lists: [], total: 0 })
    end

    it 'Returns all the lists' do
      list = List.create list_data.merge({ user_id: user[:id] })
      get "/api/list?user_id=#{user[:id]}", headers: headers
      expect(json.symbolize_keys).to eq({ lists: [list.as_json], total: 1 })
    end
  end

  describe 'Update' do
    it 'Raise an error due to list not found' do
      id = '123'
      put "/api/list/#{id}", headers: headers, params: { title: "" }
      expect(json.symbolize_keys).to eq({ error: "notFound: A list with id: #{id} was not found." })
    end

    it 'Raises an error due to empty params' do
      put "/api/list/#{list[:id]}", headers: headers, params: { title: "" }
      expect(json.symbolize_keys).to eq({ error: "param is missing or the value is empty: title" })
    end

    it 'Raise an error due to invalid title length' do
      title =  Faker::Lorem.characters(number: 101)
      put "/api/list/#{list[:id]}", headers: headers, params: { title: }
      expect(json.symbolize_keys).to eq({ error: "Title is too long (maximum is 100 characters)" })
    end

    it 'Returns a list' do
      title = "Desserts"
      put "/api/list/#{list[:id]}", headers: headers, params: { title: }
      expect(json["title"]).to eq(title)
    end

    it 'Update the database' do
      title = "Desserts"
      put "/api/list/#{list[:id]}", headers: headers, params: { title: }
      list_database = List.find(list[:id])
      expect(list_database["title"]).to eq(title)
    end
  end

  describe 'Authorization routes' do
    methods = { post: "/api/list", get: "/api/list", put: "/api/list/123" , delete: "/api/list/123" }
    invalid_token = Faker::Lorem.characters(number: 100)

    it 'Raises an error due to empty authorization header' do
      methods.each do |method, url|
        send(method, url)
        expect(json).to eq({ "message" => "Requires authentication" })
      end
    end

    it 'Raises and error due to malformed header' do
      methods.each do |method, url|
        send(method, url, headers: { "Authorization" => "not_valid"} )
        expect(json).to include( "error" => "invalid_request" )
      end
    end

    it 'Raises and error due to invalid scheme' do
      methods.each do |method, url|
        send(method, url, headers: { "Authorization" => "not_valid #{invalid_token}"} )
        expect(json).to eq({ "message" => "Bad credentials" })
      end
    end

    it 'Raises and error due to invalid token' do
      methods.each do |method, url|
        send(method, url, headers: { "Authorization" => "Bearer #{invalid_token}"} )
        expect(json).to eq({ "errors" => ["authorization: Invalid credentials"] })
      end
    end
  end
end
