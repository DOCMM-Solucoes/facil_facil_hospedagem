require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(email: 'test@example.com', password: 'password')
    expect(user).to be_valid
  end

  it 'is not valid without an email' do
    user = User.new(password: 'password')
    expect(user).not_to be_valid
    expect(user.errors[:email]).to be_present
  end

  it 'is not valid without an password' do
    user = User.new(email: 'email@test.com')
    expect(user).not_to be_valid
    expect(user.errors)
  end

  it 'is not valid with a duplicate email' do
    email = 'test@example.com'
    create(:user, email:email)

    user = build(:user, email: email)
    expect(user).not_to be_valid
    expect(user.errors[:email]).to include(I18n.t('errors.messages.taken'))
  end
end