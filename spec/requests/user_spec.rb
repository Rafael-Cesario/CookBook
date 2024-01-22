require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "POST /create" do
    user = { email: "user@email.com", name: "user", password: "password123" }

    it 'Renders an error due to empty params' do
      post "/user", params: { user: { email: '', name: '', password: '' } }
      expect(json["errors"].length).to be > 0
    end

    it 'Renders an error due to duplicate email' do
      post "/user", params: { user: }
      post "/user", params: { user: }
      expect(json["errors"]["email"]).to eq(['has already been taken'])
    end

    it 'Renders an error due to short name' do
      post "/user", params: { user: user.merge({ name: "W" })}
      expect(json["errors"]["name"]).to eq(['is too short (minimum is 3 characters)'])
    end

    it 'Renders an error due to short password' do
      post "/user", params: { user: user.merge({ password: "123" })}
      expect(json["errors"]["password"]).to eq(['is too short (minimum is 10 characters)'])
    end

    context 'Creates a new user' do
      let (:users) { User.all }

      before(:each) { post "/user", params: { user: } }

      it 'Renders a json with user data' do
        expect(json).to include("id","email", "name")
      end

      it 'Removes password from response' do
        expect(json).to_not include("password_digest")
      end

      it 'Saves user in the database' do
        expect(users.length).to be > 0
      end

    end
  end
end
