require_relative 'ar'
require 'faker'

10.times do
  category = Category.create(name: Faker::Commerce.department)

  10.times do
    category.products.create(
      name: Faker::Commerce.product_name,
      description: Faker::Lorem.sentence,
      price: Faker::Commerce.price(1.0, 100.0),
      stock_quantity: Faker::Number.between(1, 100)
    )
  end
end

categories = Category.all

categories.each do |category|
  puts "Category: #{category.name}"
  category.products.each do |product|
    puts "  Product: #{product.name}, Price: #{product.price}"
  end
end