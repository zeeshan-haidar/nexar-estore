class WishedProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @wished_products =  Product.joins(:wished_products).where(wished_products: {user_id: current_user.id}).distinct.order(id: :asc).page(params[:page]).per(8)
  end

  def create
    wished_product = current_user.wished_products.build(product_id: params[:product_id])

    if wished_product.save
      redirect_to request.referer, notice: "Product added to your wishlist."
    else
      redirect_to request.referer, alert: "You already have this product in wishlist"
    end
  end

  def destroy
    wished_product = current_user.wished_products.find_by(product_id: params[:id])
    wished_product.destroy
    redirect_to wished_products_path, notice: "Removed from your favourites."
  end
end
