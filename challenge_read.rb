require_relative 'ar.rb'

number_of_products = Product.count

puts "There are #{number_of_products} in the products table."

###################### READ ######################
# Find the first product in the products table 
# and inspect the poroduct object.
product = Product.first 
puts product.inspect

# Total number of products
total_products = Product.count
puts "Total number of products is: #{total_products}"

# Names of all products above $10 with names that begin with the letter 'C'
specific_product = Product.where("price > 10 AND name LIKE ?", 'C%')
puts "Products above $10 with names starting with 'C' are:"
specific_product.each { |product| puts product.name }

# Total number of products with low stock quantity
low_stock_products = Product.where("stock_quantity < 5")
puts "Total number of products with low stock quantity: #{low_stock_products.count}"

################### ASSOCIATION ####################

# Find the name of the category associated with one of the products
category_name = product.category.name
puts "Category of product: #{category_name}"

# Find a specific category and create a new product associated with it
category = Category.find_by(name: 'Seafood')
new_product = category.products.create(name: 'New Product', description: '50 boxes x 50 bags', price: 55.55, stock_quantity: 50)
puts "New product created: #{new_product.inspect}"

# Find a specific category and locate all associated products over a certain price
expensive_products = category.products.where("price > 10")
puts "Products with price higher than 10 in category #{category.name} are:"
expensive_products.each { |product| puts product.name }
