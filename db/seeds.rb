# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.create(name: "John", email: "john@mail.com", password: "qwe123")
apple = user.foods.create(name: "apple", measurement_unit: "unit", price: 4)
wheat = user.foods.create(name: "wheat", measurement_unit: "gram", price: 0.5)
sugar = user.foods.create(name: "sugar", measurement_unit: "gram", price: 0.2)
user.save
recipe = Recipe.create(name: "apple pie", preparation_time: 30, cooking_time: 40, description: "lorem ipsum", public: true, user_id: 1)
recipe.save
recipe2 = Recipe.create(name: "apple candy", preparation_time: 10, cooking_time: 10, description: "candy", public: false, user_id: 1)
recipe2.save