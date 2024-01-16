require 'rails_helper'

RSpec.describe User, type: :model do
  it 'Validates user fields' do
    user = User.new(
      email: "",
      name: FFaker::Name.name[1..2],
      password: FFaker::Internet.password[1..6]
    )

    user.validate

    expect(user.errors[:email]).to eq(["can't be blank"])
    expect(user.errors[:name]).to eq(["is too short (minimum is 3 characters)"])
    expect(user.errors[:password]).to eq(["is too short (minimum is 10 characters)"])
  end

  it 'Transform the password into a hash' do
    password = "Password123"
    user = User.new(password:)
    expect(user.password_digest).to_not be(password)
  end
end
