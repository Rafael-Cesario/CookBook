require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe 'POST /user' do
    it 'Does not create a user with invalid params' do
      user = { email: '', name: '', password: '' }
      post user_path, params: { user: }
      expect(User.count).to be(0);
    end

    it 'Creates a new user' do
      user = {
        email: FFaker::Internet.email,
        name: FFaker::Name.name,
        password: FFaker::Internet.password(10)
      }

      post user_path, params: { user: }
      expect(User.count).to be(1)
      expect(User.last[:password_digest]).to_not be(user[:password])
    end
  end
end
