# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Create sample categories

total_categories = Category.all.count

if total_categories > 0
  puts "Data Already Seeded"
  return
end

Category.create!([
                   { name: 'Smart Phones', description: 'Devices, gadgets, and accessories' },
                   { name: 'Smart Watches', description: 'Fiction, non-fiction, and educational materials' },
                   { name: 'Speakers', description: 'Men, women, and kids clothing' }
                 ])

# ================>>>>Insert products with category as smart phones

# First, find the category ID for "Smart Phones"
smart_phones_category = Category.find_by(name: 'Smart Phones')

# Ensure the category exists
unless smart_phones_category
  puts "Category 'Smart Phones' does not exist!"
  return
end

# Define the product data
products = [
  { name: 'Xiaomi Redmi Note 13', price: 47499 },
  { name: 'VGO TEL Note 23', price: 26999 },
  { name: 'ZTE Blade A72s', price: 20499 },
  { name: 'Xiaomi Redmi A3x', price: 18199 },
  { name: 'Xiaomi Redmi Note 13 Pro', price: 64499 },
  { name: 'Realme C63', price: 34999 },
  { name: 'Itel S23 4G', price: 18999 },
  { name: 'Vivo Y100', price: 54999 },
  { name: 'Vivo Y18', price: 37999 },
  { name: 'Samsung Galaxy A05', price: 23999 }
]

# Insert products into the products table
products.each do |product|
  Product.create!(
    name: product[:name],
    price: product[:price],
    stock_quantity: rand(0..9),
    category_id: smart_phones_category.id
  )
end

puts "Smart Phones inserted successfully!"

#===================>>>>> now insert Smart watches data

# First, find the category ID for "Smart Watches"
smart_watches_category = Category.find_by(name: 'Smart Watches')

# Ensure the category exists
unless smart_watches_category
  puts "Category 'Smart Watches' does not exist!"
  return
end

# Define the product data
smart_watches = [
  { name: 'Zero Luna Smart Watch', price: 6999 },
  { name: 'T800 Ultra 2 Smart Watch', price: 1499 },
  { name: 'S9 Ultra Bluetooth Smart Watch', price: 1499 },
  { name: 'I9 Ultra Max Smart Watch', price: 1599 },
  { name: 'Realme Watch', price: 3949 },
  { name: 'Mibro Watch Lite2', price: 11799 },
  { name: 'Haylou RS4 Plus Smart Watch', price: 10999 },
  { name: 'Itel IWS N8 Smart Watch', price: 11999 },
  { name: 'Xiaomi Redmi Watch 3 Active', price: 9599 },
  { name: 'HK9 Pro Plus Smart Watch', price: 6199 }
]

# Insert products into the products table
smart_watches.each do |watch|
  Product.create!(
    name: watch[:name],
    price: watch[:price],
    stock_quantity: rand(0..9),
    category_id: smart_watches_category.id
  )
end

puts "Smart Watches inserted successfully!"

# Now Insert Speakers

# First, find the category ID for "Speakers"
speakers_category = Category.find_by(name: 'Speakers')

# Ensure the category exists
unless speakers_category
  puts "Category 'Speakers' does not exist!"
  return
end

# Define the product data
speakers = [
  { name: 'Airox Portable Bluetooth Wireless Speaker (Extreme)', price: 1899 },
  { name: 'Sound Crush Macaron Bluetooth Speaker', price: 1899 },
  { name: 'FASTER Z10 PRO SOUNDBAR WIRELESS SPEAKER 20W', price: 5899 },
  { name: 'Faster Rainbow 7 Powerful Bass Wireless Speaker With Mic 20w', price: 6699 },
  { name: 'Tronsmart T7 Mini Portable Speaker', price: 6199 },
  { name: 'Audionic MH-801 Bluetooth Speaker', price: 8899 },
  { name: 'FASTER Rainbow 4s Portable Wireless Speaker 10w', price: 5399 },
  { name: 'Faster Bluetooth Lighting Mini Gaming Speaker with Subwoofer (G1000)', price: 4799 },
  { name: 'JBL M3 Mini Wireless Bluetooth Speaker', price: 899 },
  { name: 'Audionic Optima Sound Bar', price: 5079 }
]

# Insert products into the products table
speakers.each do |speaker|
  Product.create!(
    name: speaker[:name],
    price: speaker[:price],
    stock_quantity: rand(0..9),
    category_id: speakers_category.id
  )
end

puts "Speakers inserted successfully!"
