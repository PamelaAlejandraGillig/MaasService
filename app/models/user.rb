# frozen_string_literal: true

class User < ApplicationRecord
  include ActiveModel::Serializers::JSON
  has_secure_password
  has_many :registrations
  validates :full_name, presence: true
  validates :color, presence: true
  validates :email,
            format: { with: URI::MailTo::EMAIL_REGEXP },
            presence: true,
            uniqueness: { case_sensitive: false }

  def attributes
    { id: id, email: email, full_name: full_name, color: color }
  end
end
