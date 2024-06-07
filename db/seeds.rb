# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Create sample categories
Category.create!([
                   { name: 'Smart Phones', description: 'Devices, gadgets, and accessories' },
                   { name: 'Smart Bands', description: 'Fiction, non-fiction, and educational materials' },
                   { name: 'Air Buds', description: 'Men, women, and kids clothing' }
                 ])
