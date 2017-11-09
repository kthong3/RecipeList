# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Measurement.destroy_all
Ingredient.destroy_all
Recipe.destroy_all
RecipeIngredient.destroy_all

Measurement.create(measure: "cup")
Measurement.create(measure: "tbsp")
Measurement.create(measure: "tsp")
Measurement.create(measure: "to taste")
Measurement.create(measure: "pt")
Measurement.create(measure: "qt")
Measurement.create(measure: "gal")
Measurement.create(measure: "oz")
Measurement.create(measure: "lb")


10.times do
  Ingredient.create(item: Faker::Food.ingredient)
end

10.times do
  Recipe.create(title: Faker::Food.dish, cook_time: "1 hour", instructions: "make it")
end

i = 1
while i < 10
  RecipeIngredient.create(recipe: Recipe.find(i), ingredient: Ingredient.find(i), quantity: 1.0, measurement: Measurement.first)
  i += 1
end
