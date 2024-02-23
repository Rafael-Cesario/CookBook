module FakeDataHelper
  class FakeData
    def self.user
      {
        email: Faker::Internet.email,
        name: Faker::Name.first_name,
        password: Faker::Internet.password(min_length: 10)
      }
    end
  end
end
