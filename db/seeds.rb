# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

cat1 = Category.create! name: "Watersports"
cat1.products.create! name: "Kayak",
                      description: "A boat for one person",
                      price: 275
cat1.products.create! name: "Lifejacket",
                      description: "Protective and fashionable",
                      price: 48.95

cat2 = Category.create name: "Soccer"
cat2.products.create! name: "Soccer Ball",
                      description: "FIFA-approved size and weight",
                      price: 19.50
cat2.products.create! name: "Corner Flags",
                      description: "Give your playing field a professional touch",
                      price: 34.95
cat2.products.create! name: "Stadium",
                      description: "Flat-packed 35,000-seat stadium",
                      price: 79_500

cat3 = Category.create name: "Chess"
cat3.products.create! name: "Thinking Cap",
                      description: "Improve brain efficiency by 75%",
                      price: 16
cat3.products.create! name: "Unsteady Chair",
                      description: "Secretly give your opponent a disadvantage",
                      price: 29.95
cat3.products.create! name: "Human Chess Board",
                      description: "A fun game for the family",
                      price: 75
cat3.products.create! name: "Bling King",
                      description: "Gold-plated, diamond-studded King",
                      price: 1_200
