=begin
User.create!(email: 'admin@ffh.com', password: 'abc12345abc', password_confirmation: 'abc12345abc')
=end

5.times do |i = photo.create|
  photo = Photo.create!(
    title: Faker::Lorem.sentence,
    #image: "https://picsum.photos/800/600",  # URL de imagem do serviço Lorem Picsum
    description: Faker::Lorem.paragraph
  )
end