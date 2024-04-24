require 'rails_helper'

RSpec.describe "Authentication", type: :request do
  path = "/api/authentication"

  describe "Login" do
    user_data = FakeDataHelper::FakeData.user

    before :all do
      @user= User.create(**user_data)
    end

    after :all do
      User.destroy_all
    end

    context "Raise an error due to invalid credentials" do
      error_message = "InvalidCredentials: Your email or password is not valid."

      it "Has a wrong email" do
        post path, params: { authentication: {  email: "Wrong@Wrong.com", password: user_data[:password]  }}
        expect(json[:message]).to eq(error_message)
      end

      it "Has a wrong password" do
        post path, params: { authentication: { email: user_data[:email], password: "Wrong" }}
        expect(json[:message]).to eq(error_message)
      end
    end

    it "Renders a json with token" do
      post path, params: { authentication: { email: user_data[:email], password: user_data[:password] }}
      fields = { token: be_an_instance_of(String), id: @user[:id] , email: user_data[:email]}
      expect(json).to include(fields)
    end
  end
end
