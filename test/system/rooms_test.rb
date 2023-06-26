require "application_system_test_case"

class RoomsTest < ApplicationSystemTestCase
  setup do
    @room = rooms(:one)
  end

  test "visiting the index" do
    visit rooms_url
    assert_selector "h1", text: "Rooms"
  end

  test "should create room" do
    visit rooms_url
    click_on "New room"

    fill_in "Description", with: @room.description
    check "Is couple" if @room.is_couple
    check "Is couple plus four" if @room.is_couple_plus_four
    check "Is couple plus one" if @room.is_couple_plus_one
    check "Is couple plus three" if @room.is_couple_plus_three
    check "Is couple plus two" if @room.is_couple_plus_two
    check "Is double" if @room.is_double
    check "Is quadruple" if @room.is_quadruple
    check "Is quintuple" if @room.is_quintuple
    check "Is sextuple" if @room.is_sextuple
    check "Is single" if @room.is_single
    check "Is three couples" if @room.is_three_couples
    check "Is triple" if @room.is_triple
    check "Is two couples" if @room.is_two_couples
    check "Is two couples plus one" if @room.is_two_couples_plus_one
    check "Is two couples plus two" if @room.is_two_couples_plus_two
    fill_in "Maximum capacity", with: @room.maximum_capacity
    fill_in "Name", with: @room.name
    fill_in "Photo 1", with: @room.photo_1
    fill_in "Photo 2", with: @room.photo_2
    fill_in "Photo 3", with: @room.photo_3
    fill_in "Photo 4", with: @room.photo_4
    fill_in "Reference", with: @room.reference
    fill_in "Status", with: @room.status
    click_on "Create Room"

    assert_text "Room was successfully created"
    click_on "Back"
  end

  test "should update Room" do
    visit room_url(@room)
    click_on "Edit this room", match: :first

    fill_in "Description", with: @room.description
    check "Is couple" if @room.is_couple
    check "Is couple plus four" if @room.is_couple_plus_four
    check "Is couple plus one" if @room.is_couple_plus_one
    check "Is couple plus three" if @room.is_couple_plus_three
    check "Is couple plus two" if @room.is_couple_plus_two
    check "Is double" if @room.is_double
    check "Is quadruple" if @room.is_quadruple
    check "Is quintuple" if @room.is_quintuple
    check "Is sextuple" if @room.is_sextuple
    check "Is single" if @room.is_single
    check "Is three couples" if @room.is_three_couples
    check "Is triple" if @room.is_triple
    check "Is two couples" if @room.is_two_couples
    check "Is two couples plus one" if @room.is_two_couples_plus_one
    check "Is two couples plus two" if @room.is_two_couples_plus_two
    fill_in "Maximum capacity", with: @room.maximum_capacity
    fill_in "Name", with: @room.name
    fill_in "Photo 1", with: @room.photo_1
    fill_in "Photo 2", with: @room.photo_2
    fill_in "Photo 3", with: @room.photo_3
    fill_in "Photo 4", with: @room.photo_4
    fill_in "Reference", with: @room.reference
    fill_in "Status", with: @room.status
    click_on "Update Room"

    assert_text "Room was successfully updated"
    click_on "Back"
  end

  test "should destroy Room" do
    visit room_url(@room)
    click_on "Destroy this room", match: :first

    assert_text "Room was successfully destroyed"
  end
end
