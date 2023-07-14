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
