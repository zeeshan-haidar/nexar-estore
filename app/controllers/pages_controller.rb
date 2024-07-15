class PagesController < ApplicationController
  def home
    @products = Product.all.sample(8)
    @recently_viewd_products = Product.all.sample(6)
  end

  def product
    @product = Product.find_by(id: params[:id])
    @related_products = Product.where(category_id: @product.category_id).sample(6)
  end

  def laptop
  end

  def profile
  end

  def registration
  end

  def signin
  end
end
