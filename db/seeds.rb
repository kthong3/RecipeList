# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Recipe.destroy_all
User.destroy_all

User.create(username: "mom", email: "mom@email.com", password: "password")

10.times do
  Recipe.create(author: User.first, title: Faker::Food.dish, cook_time: "1 hour", ingredients: Faker::Food.measurement + " " + Faker::Food.ingredient, instructions: "make it")
end

User.create(username: "grandma", email: "grandma@email.com", password: "password")
Recipe.create(author: User.first, title: "Spinning Fried Chicken", cook_time: "2 days", ingredients: "1 piece of pork", instructions: "mix it all together")

