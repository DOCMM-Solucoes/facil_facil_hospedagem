require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe 'associations' do
    it { should belong_to(:guide) }
    it { should belong_to(:establishment) }
  end
end