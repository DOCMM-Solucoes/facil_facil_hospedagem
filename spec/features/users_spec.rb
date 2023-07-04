require 'rails_helper'

RSpec.describe 'Authentication', type: :feature do
  it 'User signup' do
    visit new_user_registration_path
    fill_in 'user_email', with: 'test@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'

    click_button I18n.t('sign_up')

    expect(page).to have_text(I18n.t('devise.registrations.signed_up'))
  end

  it 'User login' do
    user = create(:user, email: 'test@example.com', password: 'password')

    visit new_user_session_path
    fill_in 'user_email', with: 'test@example.com'
    fill_in 'user_password', with: 'password'

    click_button I18n.t('sign_in')

    expect(page).to have_text(I18n.t('devise.sessions.signed_in'))
  end

  it 'logs out a signed-in user' do
    user = create(:user)

    sign_in user

    visit root_path

    click_button I18n.t('home.logout')

    expect(page).to have_content(I18n.t('devise.sessions.already_signed_out'))
  end
end
