class Guide < ApplicationRecord
  has_one :address,:as =>:addressable ,dependent: :destroy
  has_and_belongs_to_many :establishments
  accepts_nested_attributes_for :address
end
