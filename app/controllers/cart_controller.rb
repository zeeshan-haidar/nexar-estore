class CartController < ApplicationController
  include Cart

  def show
    @cart_products = nil
    @cart_data = cart
    if @cart_data.present?
      @cart_products = cart_products(@cart_data)
    else
      redirect_to root_path, notice: 'Cart is empty, please add some products!'
    end
  end

  def add_product
    out_of_stock = false
    product_id = params[:product_id].to_s
    cart_data = cart
    cart_page = params[:cart_page]

    if cart_data[product_id]
      if is_available?(product_id, cart_data[product_id]+1)
        cart_data[product_id] += 1
      else
        out_of_stock = true
      end
    else
      if is_available?(product_id, 1)
        cart_data[product_id] = 1
      else
        out_of_stock = true
      end
    end

    @total_cart_items = cart_data.values.sum

    if out_of_stock
      flash.now[:error] = "This product is out of stock, please choose another product"
    else
      update_cart(cart_data)
      flash.now[:notice] = "Product added to cart successfully" unless cart_page
    end

    turbo_streams = [
      turbo_stream.replace("my_cart", partial: "cart/cart_btn", locals: { pages: @total_cart_items }),
      turbo_stream.replace("flash", partial: "shared/flash")
    ]

    if cart_page
      turbo_streams << turbo_stream.replace(
        "cart_item_quantity_#{product_id.to_s}",
        partial: "cart/cart_item_quantity",
        locals: { product: Product.find_by(id: product_id.to_i), cart_data: cart_data }
      )

      turbo_streams << turbo_stream.replace(
        "cart_summary",
        partial: "cart/cart_summary",
        locals: { cart_products: cart_products(cart_data), cart_data: cart_data }
      )
    end

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_streams
      end
    end
  end

  def remove_product
    product_id = params[:product_id].to_s
    cart_data = cart
    item_deleted = false

    if cart_data[product_id]
      if cart_data[product_id] > 1
        cart_data[product_id] -= 1
      else
        item_deleted = true
        cart_data.delete(product_id)
      end
    end

    update_cart(cart_data)

    turbo_streams = [
      turbo_stream.replace("my_cart", partial: "cart/cart_btn", locals: { pages: @total_cart_items }),
      turbo_stream.replace("cart_summary", partial: "cart/cart_summary", locals: { cart_products: cart_products(cart_data), cart_data: cart_data })
    ]

    if item_deleted
      turbo_streams << turbo_stream.replace("cart_items", partial: "cart/cart_items", locals: { cart_products: cart_products(cart_data), cart_data: cart_data })
    else
      turbo_streams << turbo_stream.replace("cart_item_quantity_#{product_id.to_s}", partial: "cart/cart_item_quantity", locals: { product: Product.find_by(id: product_id.to_i), cart_data: cart_data })
    end

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_streams
      end
    end
  end


  private

  def is_available?(product_id, quantity)
    Product.stock_available?(product_id, quantity)
  end

  def cart_products(cart_data)
    Product.where(id: cart_data.keys).order(:id => :asc)
  end
end
