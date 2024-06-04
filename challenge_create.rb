require_relative 'ar.rb'

###################### CREATE ######################

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