require_relative 'ar.rb'

###################### UPDATE ######################

# Find all products with a stock quantity greater than 40
# Add one to the stock quantity of each of these products
high_stock_products = Product.where('stock_quantity > ?', 40)

high_stock_products.each do |product|
  product.increment(:stock_quantity)
  product.save
end