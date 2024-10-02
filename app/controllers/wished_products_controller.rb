class WishedProductsController < ApplicationController
  before_action :authenticate_user!

  def create
    product = Product.find(params[:product_id])
    wished_product = current_user.wished_products.build(product: product)

    if wished_product.save
      redirect_to request.original_url, notice: "Added to your favourites."
    else
      redirect_to request.original_url, alert: "You have already favourited this product."
    end
  end

  def destroy
    wished_product = current_user.wished_products.find_by(product_id: params[:product_id])
    wished_product.destroy
    redirect_to product_path(params[:product_id]), notice: "Removed from your favourites."
  end
end
