require "test_helper"

class HoteliersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hotelier = hoteliers(:one)
  end

  test "should get index" do
    get hoteliers_url
    assert_response :success
  end

  test "should get new" do
    get new_hotelier_url
    assert_response :success
  end

  test "should create hotelier" do
    assert_difference("Hotelier.count") do
      post hoteliers_url, params: { hotelier: { cpf: @hotelier.cpf, name: @hotelier.name, phone_number: @hotelier.phone_number, plan: @hotelier.plan } }
    end

    assert_redirected_to hotelier_url(Hotelier.last)
  end

  test "should show hotelier" do
    get hotelier_url(@hotelier)
    assert_response :success
  end

  test "should get edit" do
    get edit_hotelier_url(@hotelier)
    assert_response :success
  end

  test "should update hotelier" do
    patch hotelier_url(@hotelier), params: { hotelier: { cpf: @hotelier.cpf, name: @hotelier.name, phone_number: @hotelier.phone_number, plan: @hotelier.plan } }
    assert_redirected_to hotelier_url(@hotelier)
  end

  test "should destroy hotelier" do
    assert_difference("Hotelier.count", -1) do
      delete hotelier_url(@hotelier)
    end

    assert_redirected_to hoteliers_url
  end
end
