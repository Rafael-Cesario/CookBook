require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'Create' do
    path = '/api/users'
    user_data = FakeDataHelper::FakeData.user

    after :each do
      User.destroy_all
    end

    it 'Creates a new user' do
      post path, params: { user: user_data }
      expect(json).to include({
                                id: be_an_instance_of(String),
                                email: user_data[:email].downcase,
                                message: be_an_instance_of(String)
                              })
    end

    it 'Has a secure password' do
      post path, params: { user: user_data }
      user = User.find_by(email: user_data[:email])
      expect(user[:password_digest]).to_not eq user_data[:password]
    end

    it 'Validates fields presence'

    it 'Validates email uniqueness'

    it 'Validates name length'

    it 'Downcase a email before save'
  end
end
