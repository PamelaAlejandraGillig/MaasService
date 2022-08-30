class Registration < ApplicationRecord
  belongs_to :employee
  belongs_to :turn
end
