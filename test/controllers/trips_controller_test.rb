require "test_helper"

class TripsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trip = trips(:one)
  end

  test "should get index" do
    get trips_url
    assert_response :success
  end

  test "should get new" do
    get new_trip_url
    assert_response :success
  end

  test "should create trip" do
    assert_difference("Trip.count") do
      post trips_url, params: { trip: { accomplished: @trip.accomplished, checkin_date: @trip.checkin_date, checkin_time: @trip.checkin_time, checkout_date: @trip.checkout_date, checkout_time: @trip.checkout_time, confirmed: @trip.confirmed, establishment_id: @trip.establishment_id, extra_coffee: @trip.extra_coffee, free_driver: @trip.free_driver, free_guide: @trip.free_guide, guide_id: @trip.guide_id, notes: @trip.notes, num_drivers: @trip.num_drivers, num_guides: @trip.num_guides, num_people: @trip.num_people, num_rooms: @trip.num_rooms, rate_person_day: @trip.rate_person_day, signal_date: @trip.signal_date, signal_value: @trip.signal_value, suspended: @trip.suspended } }
    end

    assert_redirected_to trip_url(Trip.last)
  end

  test "should show trip" do
    get trip_url(@trip)
    assert_response :success
  end

  test "should get edit" do
    get edit_trip_url(@trip)
    assert_response :success
  end

  test "should update trip" do
    patch trip_url(@trip), params: { trip: { accomplished: @trip.accomplished, checkin_date: @trip.checkin_date, checkin_time: @trip.checkin_time, checkout_date: @trip.checkout_date, checkout_time: @trip.checkout_time, confirmed: @trip.confirmed, establishment_id: @trip.establishment_id, extra_coffee: @trip.extra_coffee, free_driver: @trip.free_driver, free_guide: @trip.free_guide, guide_id: @trip.guide_id, notes: @trip.notes, num_drivers: @trip.num_drivers, num_guides: @trip.num_guides, num_people: @trip.num_people, num_rooms: @trip.num_rooms, rate_person_day: @trip.rate_person_day, signal_date: @trip.signal_date, signal_value: @trip.signal_value, suspended: @trip.suspended } }
    assert_redirected_to trip_url(@trip)
  end

  test "should destroy trip" do
    assert_difference("Trip.count", -1) do
      delete trip_url(@trip)
    end

    assert_redirected_to trips_url
  end
end
