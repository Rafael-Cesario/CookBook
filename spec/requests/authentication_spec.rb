require 'rails_helper'

RSpec.describe "Authentications", type: :request do
  describe "POST /login" do
    password = "Password123"
    let(:user){ User.create(email: 'user01@email.com', name: 'user01', password:) }

    it 'Raise an error due to invalid email' do
      post '/authentication', params: { authentication: { email: '', password: user[:password] } }
      expect(json['errors'][0]).to eq('Invalid credentials')
    end

    it 'Raise an error due to invalid password' do
      post '/authentication', params: { authentication: { email: user[:email], password: '123' } }
      expect(json['errors'][0]).to eq('Invalid credentials')
    end

    it 'Returns a token when successfully authenticated' do
      post '/authentication', params: { authentication: { email: user[:email], password: } }
      expect(json).to include('email', 'name', 'token')
    end

  end
end
