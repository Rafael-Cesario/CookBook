require 'rails_helper'

RSpec.describe 'Lists', type: :request do
  let(:user) { User.create(email: 'user01@email.com', name: 'user01', password: 'Password123') }

  describe 'POST /create' do
    it 'Raises an error if a user does not exist' do
      post '/list', params: { list: { user_id: '123', title: '' } }
      expect(json['errors']['user']).to eq(['must exist'])
    end

    it 'Raises and error due to empty params' do
      post '/list', params: { list: { user_id: user[:id], title: '' } }
      expect(json['errors']['title']).to include("can't be blank")
    end

    it 'Creates a new list' do
      post '/list', params: { list: { user_id: user[:id], title: 'Cakes' } }
      expect(json).to include('id', 'user_id', 'title')
    end
  end

  describe 'GET /index' do
    it 'Return all lists' do
      List.create(user_id: user[:id], title: "list01")
      get "/list?user_id=#{user[:id]}"
      expect(json['total']).to eq(1)
      expect(json['lists'].length).to be(1)
    end

    it 'Returns a empty array' do
      get "/list?user_id=#{user[:id]}"
      expect(json['total']).to eq(0)
      expect(json['lists'].length).to be(0)
    end
  end

  describe 'PATCH /update' do
    
  end
end
