# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'
Restaurant.destroy_all

puts "Creating 10 fake restaurants..."
10.times do
  new_restaurant = Restaurant.new(
    name: Faker::Food.dish,
    address: Faker::Address.street_address,
    phone_number:Faker::Company.duns_number,
    category: ["chinese", "italian", "japanese", "french", "belgian"].sample,
  )
  new_review = Review.new(
    content: Faker::TheFreshPrinceOfBelAir.quote,
    rating: (0..5).to_a.sample
    )
  new_restaurant.save!
  new_review.restaurant = new_restaurant
  new_restaurant.save!
end
puts "Finished!"

# new_review.save!
