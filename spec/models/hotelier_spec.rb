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
require 'rails_helper'

RSpec.describe Hotelier, type: :model do
  context 'associations' do
    it {should have_many(:establishments).dependent(:destroy)}
    it { should have_one(:address).dependent(:destroy) }
    it { should accept_nested_attributes_for(:address) }
  end
end
