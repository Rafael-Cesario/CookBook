require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "Create" do
    path = "/api/users"
    user_data = FakeDataHelper::FakeData.user

    after :each do
      User.destroy_all
    end

    it "Creates a new user" do
      post path, params: { user: user_data }
      expect(json).to include({
        id: be_an_instance_of(String),
        email: user_data[:email].downcase,
        message: be_an_instance_of(String)
      })
    end
  end
end
