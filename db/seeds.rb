Faker::Config.locale = 'en'

20.times do
  Property.create!({
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
end