class Order < ApplicationRecord
  belongs_to :restaurant
  has_many :order_products

  validates :name, :phone_number, :total_value, :city, :neighborhood, :street, :number, presence: true

  enum status: { waiting: 0, delivered: 1 }

  accepts_nested_attributes_for :order_products, allow_destroy: true

  before_validation :set_price
  private
  
  def set_price
    final_price = 0
    order_products.each do |order_product|
    
    final_price += order_product.quantity * order_product.product.price
    end
  self.total_value = final_price
  end
end
