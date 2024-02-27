module FakeDataHelper
  class FakeData
    def self.user() = {
      email: Faker::Internet.email,
      name: Faker::Name.first_name,
      password: Faker::Internet.password(min_length: 10)
    }

    def self.list() = { title: Faker::Food.dish }

    def self.recipe() = {
      title: Faker::Food.dish,
      ingredients: Faker::Lorem.characters(number: 20),
      instructions: Faker::Lorem.characters(number: 20),
      cooking_time: "30 minutes",
    }
  end
end
