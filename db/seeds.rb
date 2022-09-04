puts "🌱 Seeding data..."

# Make 10 users
30.times do
  User.create(name: Faker::Name.name)
end


10.times do
  # create a restaurant  with random data
  restaurant = Restaurant.create(
    name: Faker::Name.unique.name,
    location: Faker::Name.unique.name
  )
  
  # create between 1 and 5 reviews for each res
  rand(1..5).times do
    # get a random user for every review
    # https://stackoverflow.com/a/25577054
    user = User.order('RANDOM()').first

    # A review belongs to a  res and a user, so we must provide those foreign keys
    Review.create(
      body: Faker::Lorem.sentence,
      restaurant_id: restaurant.id,
      user_id: user.id
    )
  end
end

puts "🌱 Done seeding!"

