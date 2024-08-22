class PagesController < ApplicationController
  def home
    @products = Product.all.sample(8)
    @recently_viewd_products = Product.all.sample(6)
  end

  def product_category
    @products = Product.where(category_id: params[:category_id]).order(id: :asc).page(params[:page]).per(8)
    @category = @products.first.category
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
