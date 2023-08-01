require 'rails_helper'

RSpec.feature 'Hoteliers', type: :feature do

  before do
    @user = create(:user)
    sign_in @user
  end

  it 'create a new hotelier with address', skip: true do

    visit new_hotelier_path

    hotelier_name = Faker::Name.name
    hotelier_cpf = Faker::Number.number(digits: 11)
    hotelier_phone_number = Faker::PhoneNumber.phone_number
    hotelier_plan = Faker::Number.digit

    address = create(:address)

    fill_in 'hotelier_name', with: hotelier_name
    fill_in 'hotelier_cpf', with: hotelier_cpf
    fill_in 'hotelier_phone_number', with: hotelier_phone_number
    fill_in 'hotelier_plan', with: hotelier_plan

    fill_in 'hotelier_address_attributes_street', with: address.street
    fill_in 'hotelier_address_attributes_postal_code', with: address.postal_code
    fill_in 'hotelier_address_attributes_city', with: address.city
    fill_in 'hotelier_address_attributes_state', with: address.state

    click_button I18n.t('app.hotelier_form.create')

    expect(page).to have_content(I18n.t('app.hoteliers_controller.create.success'))
  end
end

