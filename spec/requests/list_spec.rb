require 'rails_helper'

RSpec.describe 'Lists', type: :request do
  let(:user) { User.create(email: 'user01@email.com', name: 'user01', password: 'Password123') }
  let(:list) { List.create(user_id: user[:id], title: 'List 01') }

  let(:token) do
    post "/authentication", params: { authentication: {  email: user[:email], password: "Password123" } }
    json['token']
  end

  def headers
    { 'Authorization': "Bearer #{token}"}
  end

  describe 'POST /create' do
    it 'Raises an error if a user does not exist' do
      post '/list', params: { list: { user_id: '123', title: '' } }, headers: headers
      expect(json['errors']['user']).to eq(['must exist'])
    end

    it 'Raises and error due to empty params' do
      post '/list', params: { list: { user_id: user[:id], title: '' } }, headers: headers
      expect(json['errors']['title']).to include("can't be blank")
    end

    it 'Creates a new list' do
      post '/list', params: { list: { user_id: user[:id], title: 'Cakes' } }, headers: headers
      expect(json).to include('id', 'user_id', 'title')
    end
  end

  describe 'GET /index' do
    it 'Return all lists' do
      List.create(user_id: user[:id], title: 'list01')
      get "/list?user_id=#{user[:id]}", headers: headers
      expect(json['total']).to eq(1)
      expect(json['lists'].length).to be(1)
    end

    it 'Returns a empty array' do
      get "/list?user_id=#{user[:id]}", headers: headers
      expect(json['total']).to eq(0)
      expect(json['lists'].length).to be(0)
    end
  end

  describe 'PATCH /update' do
    it 'Raises an error due to list not found by id' do
      patch '/list/123', headers: headers
      expect(json['errors']).to include('notFound: A list with the current id was not found')
    end

    it 'Raises an error if title is too short' do
      patch "/list/#{list[:id]}", params: { title: 'S' }, headers: headers
      expect(json['errors']['title']).to include('is too short (minimum is 3 characters)')
    end

    it 'Raises an error if title is too long' do
      patch "/list/#{list[:id]}", params: { title: 'Lorem ipsum dolor sit amet non.' }, headers: headers
      expect(json['errors']['title']).to include('is too long (maximum is 30 characters)')
    end

    it 'Update and return the list' do
      new_title = 'Desserts'
      patch "/list/#{list[:id]}", params: { title: new_title }, headers: headers
      new_list = List.find(list[:id])

      expect(json['title']).to eq(new_title)
      expect(new_list[:title]).to eq(new_title)
    end
  end

  describe 'DELETE /destroy' do
    it 'Raises an error if list was not found' do
      delete '/list/123', headers: headers
      expect(json['errors']).to include('notFound: List not found')
    end

    it 'Removes list from database' do
      total = 5
      total.times { |i| List.create(title: "list-0#{i}", user_id: user[:id]) }

      list = List.first
      delete "/list/#{list[:id]}", headers: headers

      expect(List.all.length).to be(total - 1)
    end
  end
end
