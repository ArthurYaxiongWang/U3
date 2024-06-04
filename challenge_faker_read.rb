require_relative 'ar'
require 'faker'

categories = Category.all

categories.each do |category|
  puts "Category: #{category.name}"
  category.products.each do |product|
    puts "  Product: #{product.name}, Price: #{product.price}"
  end
end