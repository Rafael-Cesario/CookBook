require 'rails_helper'

RSpec.describe "Authentications", type: :request do
  user_data = { email: "user01@email.com", password: "password123", name: "user01" }
  let(:user) { User.create(**user_data) }

  describe "Post login" do
    it 'Raises an error due to invalid email' do
      params = { authentication: { email: "", password: "" }}
      post "/api/authentication", params:;
      expect(json).to include("errors" => ["authentication: Invalid credentials."])
    end

    it 'Raises an error due to invalid password' do
      params = { authentication: { email: user[:email], password: "wrong" }}
      post "/api/authentication", params:;
      expect(json).to include("errors" => ["authentication: Invalid credentials."])
    end

    it 'Creates a JWT token' do
      params = { authentication: { email: user[:email], password: user_data[:password]}}
      post "/api/authentication", params:;
      expect(json).to include("token" => a_kind_of(String))
    end

    it 'Returns user data' do
      params = { authentication: { email: user[:email], password: user_data[:password]}}
      post "/api/authentication", params:;
      expect(json).to include("email" => user[:email], "id" => user[:id], "name" => user[:name])
    end
  end
end
