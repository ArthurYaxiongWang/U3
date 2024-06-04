require_relative 'ar.rb'

###################### DELETE ######################

# Find one of the products created earlier and delete it
product_to_delete = Product.find_by(name: 'Product 1')
product_to_delete.destroy if product_to_delete