# frozen_string_literal: true

class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :turn
  validates :date_from, presence: true
  validates :date_end, presence: true
end
