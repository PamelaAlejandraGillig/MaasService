require 'faker'
require 'pry'

FactoryBot.define do
  factory :turn do
    name { Faker::Name.name }
  end
end
