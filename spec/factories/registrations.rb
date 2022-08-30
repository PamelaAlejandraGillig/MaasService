require 'faker'
require 'pry'

FactoryBot.define do
  factory :registration do
    name { Faker::Name.name }
  end
end
