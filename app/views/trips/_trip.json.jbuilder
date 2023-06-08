json.extract! trip, :id, :establishment_id, :guide_id, :checkin_date, :checkin_time, :checkout_date, :checkout_time, :extra_coffee, :num_people, :num_drivers, :free_driver, :num_guides, :free_guide, :num_rooms, :rate_person_day, :signal_value, :signal_date, :notes, :confirmed, :accomplished, :suspended, :created_at, :updated_at
json.url trip_url(trip, format: :json)
