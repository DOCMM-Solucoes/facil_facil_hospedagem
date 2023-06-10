class Establishment < ApplicationRecord
  has_one :address,:as =>:addressable ,dependent: :destroy
  belongs_to :hotelier
  accepts_nested_attributes_for :address
  has_many :trips
  has_many :guides, through: :trips
end
