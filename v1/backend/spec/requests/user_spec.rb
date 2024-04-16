require 'rails_helper'

RSpec.describe "Users", type: :request do
  USER_DATA = { email: "user01@email.com", name: "user01", password: "password123" }

  describe 'POST /create' do
    it 'Transform the password into a hash' do
      post "/api/user", params: { user: USER_DATA }
      user = User.find_by(email: USER_DATA[:email])
      expect(user.password_digest).to_not eq(USER_DATA[:password])
    end

    it 'Validates the presence of fields' do
      fields = {email: "", password: "", name: "" }
      post "/api/user", params: { user: fields }
      fields.keys.each { |key| expect(json[key.to_s]).to include("can't be blank") }
    end

    it 'Validate duplicated email' do
      post "/api/user", params: { user: USER_DATA }
      post "/api/user", params: { user: USER_DATA.merge({ email: "USER01@EMAIL.COM" }) }
      expect(json).to include("email" => ['has already been taken'])
    end

    it 'Validates the lenth of name and password' do
      user = { email: "user01@email.com", name: "qweqweqweqweqweqweqweqwe", password: "123123" }
      post "/api/user", params: { user: }
      expect(json).to include("name" => ['is too long (maximum is 20 characters)'])
      expect(json).to include("password" => ['is too short (minimum is 10 characters)'])
    end

    it 'Creates a new user' do
      post "/api/user", params: { user: USER_DATA }
      expected = { id: a_kind_of(String), email: USER_DATA[:email], name: USER_DATA[:name] }
      expect(json["user"].symbolize_keys).to include(expected)
    end
  end
end
