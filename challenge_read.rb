require_relative 'ar.rb'

number_of_products = Product.count

puts "There are #{number_of_products} in the products table."

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

# Creating three new products using different methods
# Method 1: new and save
product1 = Product.new(name: 'Product 1', description: '10 boxes x 10 bags', price: 11.11, stock_quantity: 10)
product1.save

# Method 2: create
product2 = Product.create(name: 'Product 2', description: '20 boxes x 20 bags', price: 22.22, stock_quantity: 20)

# Method 3: new and save with a block
product3 = Product.new do |p|
  p.name = 'Product 3'
  p.description = '30 boxes x 30 bags'
  p.price = 33.33
  p.stock_quantity = 30
end
product3.save

# Attempt to save an invalid product and print errors
invalid_product = Product.new(name: 'Invalid Product')
if invalid_product.save
  puts "Invalid product saved successfully."
else
  puts "Errors: #{invalid_product.errors.full_messages.join(', ')}"
end

# Find all products with a stock quantity greater than 40
# Add one to the stock quantity of each of these products
high_stock_products = Product.where('stock_quantity > ?', 40)

high_stock_products.each do |product|
  product.increment(:stock_quantity)
  product.save
end

# Find one of the products created earlier and delete it
product_to_delete = Product.find_by(name: 'Product 1')
product_to_delete.destroy if product_to_delete

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
