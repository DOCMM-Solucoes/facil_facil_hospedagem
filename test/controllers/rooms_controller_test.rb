require "test_helper"

class RoomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @room = rooms(:one)
  end

  test "should get index" do
    get rooms_url
    assert_response :success
  end

  test "should get new" do
    get new_room_url
    assert_response :success
  end

  test "should create room" do
    assert_difference("Room.count") do
      post rooms_url, params: { room: { description: @room.description, is_couple: @room.is_couple, is_couple_plus_four: @room.is_couple_plus_four, is_couple_plus_one: @room.is_couple_plus_one, is_couple_plus_three: @room.is_couple_plus_three, is_couple_plus_two: @room.is_couple_plus_two, is_double: @room.is_double, is_quadruple: @room.is_quadruple, is_quintuple: @room.is_quintuple, is_sextuple: @room.is_sextuple, is_single: @room.is_single, is_three_couples: @room.is_three_couples, is_triple: @room.is_triple, is_two_couples: @room.is_two_couples, is_two_couples_plus_one: @room.is_two_couples_plus_one, is_two_couples_plus_two: @room.is_two_couples_plus_two, maximum_capacity: @room.maximum_capacity, name: @room.name, photo_1: @room.photo_1, photo_2: @room.photo_2, photo_3: @room.photo_3, photo_4: @room.photo_4, reference: @room.reference, status: @room.status } }
    end

    assert_redirected_to room_url(Room.last)
  end

  test "should show room" do
    get room_url(@room)
    assert_response :success
  end

  test "should get edit" do
    get edit_room_url(@room)
    assert_response :success
  end

  test "should update room" do
    patch room_url(@room), params: { room: { description: @room.description, is_couple: @room.is_couple, is_couple_plus_four: @room.is_couple_plus_four, is_couple_plus_one: @room.is_couple_plus_one, is_couple_plus_three: @room.is_couple_plus_three, is_couple_plus_two: @room.is_couple_plus_two, is_double: @room.is_double, is_quadruple: @room.is_quadruple, is_quintuple: @room.is_quintuple, is_sextuple: @room.is_sextuple, is_single: @room.is_single, is_three_couples: @room.is_three_couples, is_triple: @room.is_triple, is_two_couples: @room.is_two_couples, is_two_couples_plus_one: @room.is_two_couples_plus_one, is_two_couples_plus_two: @room.is_two_couples_plus_two, maximum_capacity: @room.maximum_capacity, name: @room.name, photo_1: @room.photo_1, photo_2: @room.photo_2, photo_3: @room.photo_3, photo_4: @room.photo_4, reference: @room.reference, status: @room.status } }
    assert_redirected_to room_url(@room)
  end

  test "should destroy room" do
    assert_difference("Room.count", -1) do
      delete room_url(@room)
    end

    assert_redirected_to rooms_url
  end
end
