require "application_system_test_case"

class GuidesTest < ApplicationSystemTestCase
  setup do
    @guide = guides(:one)
  end

  test "visiting the index" do
    visit guides_url
    assert_selector "h1", text: "Guides"
  end

  test "should create guide" do
    visit guides_url
    click_on "New guide"

    fill_in "City", with: @guide.city
    fill_in "Cnpj", with: @guide.cnpj
    fill_in "Cpf", with: @guide.cpf
    fill_in "Enterprise", with: @guide.enterprise
    fill_in "Guide", with: @guide.guide
    fill_in "Phone", with: @guide.phone
    fill_in "Uf", with: @guide.uf
    click_on "Create Guide"

    assert_text "Guide was successfully created"
    click_on "Back"
  end

  test "should update Guide" do
    visit guide_url(@guide)
    click_on "Edit this guide", match: :first

    fill_in "City", with: @guide.city
    fill_in "Cnpj", with: @guide.cnpj
    fill_in "Cpf", with: @guide.cpf
    fill_in "Enterprise", with: @guide.enterprise
    fill_in "Guide", with: @guide.guide
    fill_in "Phone", with: @guide.phone
    fill_in "Uf", with: @guide.uf
    click_on "Update Guide"

    assert_text "Guide was successfully updated"
    click_on "Back"
  end

  test "should destroy Guide" do
    visit guide_url(@guide)
    click_on "Destroy this guide", match: :first

    assert_text "Guide was successfully destroyed"
  end
end
