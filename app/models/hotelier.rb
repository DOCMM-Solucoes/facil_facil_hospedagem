class Hotelier < ApplicationRecord
  has_one :address,:as =>:addressable ,dependent: :destroy
  has_many :establishments

  accepts_nested_attributes_for :address
end
