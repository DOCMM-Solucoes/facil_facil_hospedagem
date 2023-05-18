require "application_system_test_case"

class GuiaTest < ApplicationSystemTestCase
  setup do
    @guium = guia(:one)
  end

  test "visiting the index" do
    visit guia_url
    assert_selector "h1", text: "Guia"
  end

  test "should create guium" do
    visit guia_url
    click_on "New guium"

    fill_in "Cnpj", with: @guium.CNPJ
    fill_in "Cpf", with: @guium.CPF
    fill_in "Cidade", with: @guium.Cidade
    fill_in "Nome do guia", with: @guium.Nome_do_guia
    fill_in "Telefone", with: @guium.Telefone
    fill_in "Us", with: @guium.US
    click_on "Create Guium"

    assert_text "Guium was successfully created"
    click_on "Back"
  end

  test "should update Guium" do
    visit guium_url(@guium)
    click_on "Edit this guium", match: :first

    fill_in "Cnpj", with: @guium.CNPJ
    fill_in "Cpf", with: @guium.CPF
    fill_in "Cidade", with: @guium.Cidade
    fill_in "Nome do guia", with: @guium.Nome_do_guia
    fill_in "Telefone", with: @guium.Telefone
    fill_in "Us", with: @guium.US
    click_on "Update Guium"

    assert_text "Guium was successfully updated"
    click_on "Back"
  end

  test "should destroy Guium" do
    visit guium_url(@guium)
    click_on "Destroy this guium", match: :first

    assert_text "Guium was successfully destroyed"
  end
end
