module Cart
  extend ActiveSupport::Concern

  def cart
    if cookies[:nexar_cart].present?
      JSON.parse(cookies[:nexar_cart])
    else
      {}
    end
  end

  def update_cart(cart)
    cookies[:nexar_cart] = { value: cart.to_json, expires: 1.week.from_now }
  end

  def delete_cart
    cookies[:nexar_cart] = nil
  end

  def cart_products(cart_data)
    Product.where(id: cart_data.keys).order(id: :asc)
  end

  def order_detail(payment)
    cart_data = payment.order_details
    products = cart_products(cart_data)
    products_array = []
    products.each do |product|
      products_hash = {
        product:,
        quantity: cart_data[product.id.to_s].to_i
      }
      products_array << products_hash
    end

    order_detail = {
      invoice_date: payment.created_at.to_date,
      amount: payment.price.to_f,
      products_data: products_array,
      invoice_id: payment.id,
      user_first_name: payment.user.first_name,
      shipping_address: payment.shipping_address
    }
  end
end
