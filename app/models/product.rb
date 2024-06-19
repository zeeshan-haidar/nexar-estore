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

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :stock_quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  accepts_nested_attributes_for :product_images, allow_destroy: true
  before_save :set_old_price

  def set_old_price
    discount = (25.to_f/100.to_f * price).round(2)
    self.old_price = price + discount
  end
end
