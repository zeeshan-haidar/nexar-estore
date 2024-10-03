# == Schema Information
#
# Table name: products
#
#  id             :bigint           not null, primary key
#  description    :text
#  name           :string           not null
#  old_price      :decimal(10, 2)
#  price          :decimal(10, 2)   not null
#  stock_quantity :integer          default(0), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  category_id    :integer
#
class Product < ApplicationRecord
  has_many :product_images, dependent: :destroy
  belongs_to :category
  has_many :wished_products, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :stock_quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  accepts_nested_attributes_for :product_images, allow_destroy: true
  before_save :set_old_price

  def set_old_price
    discount = (25.to_f / 100 * price).round(2)
    self.old_price = price + discount
  end

  def discount
    old_price - price
  end

  def main_images
    product_images.where.not(image: nil).where(is_primary: false)
  end

  def self.stock_available?(product_id, product_quantity)
    product = find_by(id: product_id)
    product.stock_quantity >= product_quantity
  end
end
