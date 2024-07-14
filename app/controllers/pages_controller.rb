class PagesController < ApplicationController
  def home
    @products = Product.all.sample(8)
    @recently_viewd_products = Product.all.sample(6)
  end

  def product
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
