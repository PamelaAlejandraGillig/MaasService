# frozen_string_literal: true

require 'faker'
require 'pry'

FactoryBot.define do
  factory :contract do
    name { Faker::Name.name }
  end
end
