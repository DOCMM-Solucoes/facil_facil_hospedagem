require "test_helper"

class GuiaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @guium = guia(:one)
  end

  test "should get index" do
    get guia_url
    assert_response :success
  end

  test "should get new" do
    get new_guium_url
    assert_response :success
  end

  test "should create guium" do
    assert_difference("Guium.count") do
      post guia_url, params: { guium: { CNPJ: @guium.CNPJ, CPF: @guium.CPF, Cidade: @guium.Cidade, Nome_do_guia: @guium.Nome_do_guia, Telefone: @guium.Telefone, US: @guium.US } }
    end

    assert_redirected_to guium_url(Guium.last)
  end

  test "should show guium" do
    get guium_url(@guium)
    assert_response :success
  end

  test "should get edit" do
    get edit_guium_url(@guium)
    assert_response :success
  end

  test "should update guium" do
    patch guium_url(@guium), params: { guium: { CNPJ: @guium.CNPJ, CPF: @guium.CPF, Cidade: @guium.Cidade, Nome_do_guia: @guium.Nome_do_guia, Telefone: @guium.Telefone, US: @guium.US } }
    assert_redirected_to guium_url(@guium)
  end

  test "should destroy guium" do
    assert_difference("Guium.count", -1) do
      delete guium_url(@guium)
    end

    assert_redirected_to guia_url
  end
end
