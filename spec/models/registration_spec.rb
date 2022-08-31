# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Registration, type: :model do
  it { is_expected.to validate_presence_of(:date_from) }
  it { is_expected.to validate_presence_of(:date_end) }
end
