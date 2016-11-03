class Product < ApplicationRecord
  has_and_belongs_to_many :carts
  validates :price, :numericality => { :greater_than_or_equal_to => 0 }
  def self.less_than_5
    where('price < 5')
  end

  def description?
    description.present?
  end
end
