class Hotelier < ApplicationRecord
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
end
