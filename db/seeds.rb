Faker::Config.locale = 'en'

user = User.create!({
  email: "test1@test.com",
  password: "test1@test.com"
})

6.times do |i|
  property = Property.create!({
    name: Faker::Lorem.unique.sentence(word_count: 3),
    headline: Faker::Lorem.paragraph(sentence_count: 10),
    description: Faker::Lorem.unique.sentence(word_count: 6),
    address: Faker::Address.street_address,
    address_detail: Faker::Address.secondary_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    country: Faker::Address.country,
    price: Money.from_amount(Faker::Number.between(from: 100000, to: 1000000), "KRW")

  })
  property.images.attach(io: File.open(Rails.root.join("db/images/property_#{i+1}.png")), filename: property.name)
  property.images.attach(io: File.open(Rails.root.join("db/images/property_#{i+7}.png")), filename: property.name)

  (5...10).to_a.sample.times do 
    Review.create!({
      content: Faker::Lorem.paragraph(sentence_count: 10),
      cleanliness_rating: Faker::Number.between(from: 1, to: 5),
      accuracy_rating: Faker::Number.between(from: 1, to: 5),
      chekin_rating: Faker::Number.between(from: 1, to: 5),
      communication_rating: Faker::Number.between(from: 1, to: 5),
      location_rating: Faker::Number.between(from: 1, to: 5),
      value_rating: Faker::Number.between(from: 1, to: 5),
      property: property,
      user: user,
    })
  end
end