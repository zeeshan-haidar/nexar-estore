# == Schema Information
#
# Table name: product_images
#
#  id         :bigint           not null, primary key
#  image      :string
#  is_primary :boolean          default(FALSE), not null
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

  mount_uploader :image, ProductImageUploader

  validate :only_one_primary_image, if: :is_primary?

  private

  def only_one_primary_image
    return unless ProductImage.where(product_id:, is_primary: true).where.not(id:).exists?

    errors.add(:is_primary, 'There can be only one primary image per product.')
  end
end
