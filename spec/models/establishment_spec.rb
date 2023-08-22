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
require 'rails_helper'

RSpec.describe Establishment, type: :model do
  describe 'associations' do
    it { should have_one(:address).dependent(:destroy) }
    it { should belong_to(:hotelier) }
    it { should have_many(:trips).dependent(:destroy) }
    it { should have_many(:guides).through(:trips) }
  end

  describe 'nested attributes' do
    it { should accept_nested_attributes_for(:address) }
  end
end
