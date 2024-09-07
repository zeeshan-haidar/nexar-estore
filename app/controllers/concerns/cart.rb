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
end
