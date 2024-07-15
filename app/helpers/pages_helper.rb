module PagesHelper
  def primary_image_url(product)
    product.product_images.where(is_primary: true).first&.image&.url
  end
end
