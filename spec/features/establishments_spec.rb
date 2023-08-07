require 'rails_helper'

RSpec.feature 'Establishments', type: :feature do
  before do
    @user = create(:user)
    sign_in @user
    @hotelier = create(:hotelier)
  end

  it 'creates a new establishment with address', skip: true do
    visit new_establishment_path

    establishment_name = Faker::Name.name
    establishment_qty_bedrooms = Faker::Number.between(from: 5, to: 500)
    establishment_phone = Faker::PhoneNumber.phone_number
    establishment_site = Faker::Internet.ip_v4_address

    address = create(:address)

    fill_in 'establishment_name', with: establishment_name
    fill_in 'establishment_qty_bedrooms', with: establishment_qty_bedrooms
    fill_in 'establishment_phone', with: establishment_phone
    fill_in 'establishment_site', with: establishment_site

    fill_in 'establishment_address_attributes_street', with: address.street
    fill_in 'establishment_address_attributes_postal_code', with: address.postal_code
    fill_in 'establishment_address_attributes_city', with: address.city
    fill_in 'establishment_address_attributes_state', with: address.state

    select @hotelier.name, from: 'establishment_hotelier_id'

    click_button I18n.t('app.hotelier_form.create')

    expect(page).to have_content(I18n.t('app.controller.create.success'))
  end
end
