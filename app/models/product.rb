class Product < ApplicationRecord
  has_and_belongs_to_many :carts
  validates :price, :numericality => { :greater_than_or_equal_to => 0 }
end
