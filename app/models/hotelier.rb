# == Schema Information
#
# Table name: hoteliers
#
#  id           :bigint           not null, primary key
#  cpf          :string
#  name         :string
#  phone_number :string
#  plan         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Hotelier < ApplicationRecord
  has_one :address,:as =>:addressable ,dependent: :destroy
  has_many :establishments, dependent: :destroy

  accepts_nested_attributes_for :address

  validates :name, :phone_number, presence: :true
end
