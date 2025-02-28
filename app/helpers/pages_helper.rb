module PagesHelper
  include Cart
  def primary_image_url(product)
    image = product.product_images.where(is_primary: true).first&.image&.url
    image = "products/default_product.jpg" unless image.present?
    image
  end

  def total_cart_items
    total_cart_items = 0
    cart_data = cart
    total_cart_items = cart_data.values.sum if cart_data.present?
    total_cart_items
  end

  def total_items(cart_data)
    cart_data.values.sum
  end

  def total_cart_amount(cart_data, cart_products)
    total_amount = 0
    delivery_charges = 5
    cart_products.each do |product|
      total_amount += product.price * cart_data[product.id.to_s]
    end
    total_amount + delivery_charges
  end
end
