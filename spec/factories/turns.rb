# frozen_string_literal: true

require 'faker'
require 'pry'

FactoryBot.define do
  factory :turn do
    period { { "1": { "start_at": 9, "end_at": 11 } } }
    week { Faker::Number }
  end
end
