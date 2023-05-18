require "application_system_test_case"

class HoteliersTest < ApplicationSystemTestCase
  setup do
    @hotelier = hoteliers(:one)
  end

  test "visiting the index" do
    visit hoteliers_url
    assert_selector "h1", text: "Hoteliers"
  end

  test "should create hotelier" do
    visit hoteliers_url
    click_on "New hotelier"

    fill_in "Cpf", with: @hotelier.cpf
    fill_in "Name", with: @hotelier.name
    fill_in "Phone number", with: @hotelier.phone_number
    fill_in "Plan", with: @hotelier.plan
    click_on "Create Hotelier"

    assert_text "Hotelier was successfully created"
    click_on "Back"
  end

  test "should update Hotelier" do
    visit hotelier_url(@hotelier)
    click_on "Edit this hotelier", match: :first

    fill_in "Cpf", with: @hotelier.cpf
    fill_in "Name", with: @hotelier.name
    fill_in "Phone number", with: @hotelier.phone_number
    fill_in "Plan", with: @hotelier.plan
    click_on "Update Hotelier"

    assert_text "Hotelier was successfully updated"
    click_on "Back"
  end

  test "should destroy Hotelier" do
    visit hotelier_url(@hotelier)
    click_on "Destroy this hotelier", match: :first

    assert_text "Hotelier was successfully destroyed"
  end
end
