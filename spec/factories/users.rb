# frozen_string_literal: true

require 'faker'
require 'pry'

FactoryBot.define do
  factory :user do
    full_name { Faker::Name.name }
    color { Faker::Color }
    email { Faker::Internet.email }
    password_digest { '$2a$12$uhWNpyI8I04hDldW6iPOXuT6KmxOc2Ojk1Kuw5GQ5rvIZEzNGrQ/.' }
  end
end
