User.create!(email: 'admin@ffh.com', password: 'abc12345abc', password_confirmation: 'abc12345abc')

hotelier = Hotelier.create(name: "Maick")

establishment = Establishment.create(name: "Pousada Porto Seguro Resort", qty_bedrooms: 20, hotelier: hotelier)

Address.create(city: "Porto Seguro", state: "Bahia", addressable: establishment)