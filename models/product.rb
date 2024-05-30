class Product < ActiveRecord::Base
  # This AR object is linked with the products table.
  
  # A product has a many to one relationship with a category.
  # The products table has a category_id foreign key.
  # In other words, a product belongs to a category.

  # Columns in the products table:
  # id, name, description, price, stock_quantity, category_id, created_at, updated_at

  # There is a category_id column in the products table. 
  # It means that a product belongs to a category.

  belongs_to :category

  # Add validations to the Product model.
  validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :description, presence: true
  validates :price, presence: true
  validates :stock_quantity, presence: true
end