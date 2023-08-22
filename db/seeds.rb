User.create!(email: 'admin@ffh.com', password: 'abc12345abc', password_confirmation: 'abc12345abc')

hotelier = Hotelier.create(name: "Maick")

establishment = Establishment.create(name: "Pousada Porto Seguro Resort", qty_bedrooms: 20, hotelier: hotelier)

Address.create(city: "Porto Seguro", state: "Bahia", addressable: establishment)

5.times do
  guide = Guide.create!(
    name: Faker::Name.name,
    phone: Faker::PhoneNumber.cell_phone,
    cpf: Faker::IDNumber.brazilian_citizen_number,
    company: Faker::Company.name,
    cnpj: Faker::Company.brazilian_company_number
  )

  guide.create_address!(
    street: Faker::Address.street_name,
    postal_code: Faker::Address.postcode,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr
  )
end

10.times do
  guide = Guide.all.sample

  Trip.create!(
    establishment: Establishment.all.sample,
    guide: guide,
    checkin_date: Faker::Date.between(from: 1.year.ago, to: Date.today),
    checkin_time: Faker::Time.between_dates(from: Date.today, to: Date.today, period: :all),
    checkout_date: Faker::Date.between(from: Date.today, to: 1.year.from_now),
    checkout_time: Faker::Time.between_dates(from: Date.today, to: Date.today, period: :all),
    extra_coffee: [true, false].sample,
    num_people: rand(1..10),
    num_drivers: rand(1..3),
    free_driver: [true, false].sample,
    num_guides: rand(1..3),
    free_guide: [true, false].sample,
    num_rooms: rand(1..5),
    rate_person_day: rand(50.0..300.0).round(2),
    signal_value: rand(10.0..50.0).round(2),
    signal_date: Faker::Date.between(from: Date.today, to: 1.year.from_now),
    notes: Faker::Lorem.paragraph,
    confirmed: [true, false].sample,
    accomplished: [true, false].sample,
    suspended: [true, false].sample
  )
end

5.times do |i = photo.create|
  photo = Photo.create!(
    title: Faker::Lorem.sentence,
    #image: "https://picsum.photos/800/600",  # URL de imagem do serviço Lorem Picsum
    description: Faker::Lorem.paragraph
  )
end