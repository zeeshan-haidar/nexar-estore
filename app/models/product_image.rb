# == Schema Information
#
# Table name: product_images
#
#  id         :bigint           not null, primary key
#  is_primary :boolean          default(FALSE), not null
#  s3_url     :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint           not null
#
# Indexes
#
#  index_product_images_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#
class ProductImage < ApplicationRecord
  belongs_to :product

  validates :s3_url, presence: true
end
