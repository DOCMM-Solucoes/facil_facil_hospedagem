require "application_system_test_case"

class TripsTest < ApplicationSystemTestCase
  setup do
    @trip = trips(:one)
  end

  test "visiting the index" do
    visit trips_url
    assert_selector "h1", text: "Trips"
  end

  test "should create trip" do
    visit trips_url
    click_on "New trip"

    check "Accomplished" if @trip.accomplished
    fill_in "Checkin date", with: @trip.checkin_date
    fill_in "Checkin time", with: @trip.checkin_time
    fill_in "Checkout date", with: @trip.checkout_date
    fill_in "Checkout time", with: @trip.checkout_time
    check "Confirmed" if @trip.confirmed
    fill_in "Establishment", with: @trip.establishment_id
    check "Extra coffee" if @trip.extra_coffee
    check "Free driver" if @trip.free_driver
    check "Free guide" if @trip.free_guide
    fill_in "Guide", with: @trip.guide_id
    fill_in "Notes", with: @trip.notes
    fill_in "Num drivers", with: @trip.num_drivers
    fill_in "Num guides", with: @trip.num_guides
    fill_in "Num people", with: @trip.num_people
    fill_in "Num rooms", with: @trip.num_rooms
    fill_in "Rate person day", with: @trip.rate_person_day
    fill_in "Signal date", with: @trip.signal_date
    fill_in "Signal value", with: @trip.signal_value
    check "Suspended" if @trip.suspended
    click_on "Create Trip"

    assert_text "Trip was successfully created"
    click_on "Back"
  end

  test "should update Trip" do
    visit trip_url(@trip)
    click_on "Edit this trip", match: :first

    check "Accomplished" if @trip.accomplished
    fill_in "Checkin date", with: @trip.checkin_date
    fill_in "Checkin time", with: @trip.checkin_time
    fill_in "Checkout date", with: @trip.checkout_date
    fill_in "Checkout time", with: @trip.checkout_time
    check "Confirmed" if @trip.confirmed
    fill_in "Establishment", with: @trip.establishment_id
    check "Extra coffee" if @trip.extra_coffee
    check "Free driver" if @trip.free_driver
    check "Free guide" if @trip.free_guide
    fill_in "Guide", with: @trip.guide_id
    fill_in "Notes", with: @trip.notes
    fill_in "Num drivers", with: @trip.num_drivers
    fill_in "Num guides", with: @trip.num_guides
    fill_in "Num people", with: @trip.num_people
    fill_in "Num rooms", with: @trip.num_rooms
    fill_in "Rate person day", with: @trip.rate_person_day
    fill_in "Signal date", with: @trip.signal_date
    fill_in "Signal value", with: @trip.signal_value
    check "Suspended" if @trip.suspended
    click_on "Update Trip"

    assert_text "Trip was successfully updated"
    click_on "Back"
  end

  test "should destroy Trip" do
    visit trip_url(@trip)
    click_on "Destroy this trip", match: :first

    assert_text "Trip was successfully destroyed"
  end
end
