# == Schema Information
#
# Table name: establishments
#
#  id           :bigint           not null, primary key
#  name         :string
#  phone        :string
#  qty_bedrooms :string
#  site         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  hotelier_id  :bigint           not null
#
# Indexes
#
#  index_establishments_on_hotelier_id  (hotelier_id)
#
# Foreign Keys
#
#  fk_rails_...  (hotelier_id => hoteliers.id)
#
class Establishment < ApplicationRecord
  has_one :address,as: :addressable ,dependent: :destroy
  belongs_to :hotelier
  accepts_nested_attributes_for :address
  has_many :trips, dependent: :destroy
  has_many :guides, through: :trips
end
