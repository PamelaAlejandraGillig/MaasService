# frozen_string_literal: true

require 'faker'
require 'pry'

FactoryBot.define do
  factory :registration do
    date_from { Faker::Date }
    date_end { Faker::Date }
  end
end
