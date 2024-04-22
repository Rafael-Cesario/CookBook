module FakeDataHelper
  class FakeData
    def self.user() = {
      email: Faker::Internet.email,
      password: Faker::Internet.password(min_length: 12),
      name: Faker::Name.first_name
    }
  end
end
