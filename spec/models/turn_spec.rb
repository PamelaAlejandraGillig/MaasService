# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Turn, type: :model do
  it { is_expected.to validate_presence_of(:period) }
  it { is_expected.to validate_presence_of(:week) }
end
