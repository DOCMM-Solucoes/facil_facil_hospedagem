class Establishment < ApplicationRecord
  has_one :address,:as =>:addressable ,dependent: :destroy
  belongs_to :hotelier
  has_and_belongs_to_many :guides
  accepts_nested_attributes_for :address
end
