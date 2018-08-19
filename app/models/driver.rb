class Driver < ApplicationRecord
  has_many :orders
  validates_presence_of :name, :email, :phone, :drivers_license_number, :drivers_license_state, :vehicle_license_plate
  validates_inclusion_of :background_check_clear, in: [true, false]
end
