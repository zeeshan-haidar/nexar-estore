class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_product, only: [:edit, :update, :destroy]

  def index
    @products = @products.order(id: :asc).page(params[:page]).per(10) # 10 products per page
  end

  def new
    @product = Product.new
    4.times { @product.product_images.build }
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def edit
    (4 - @product.product_images.size).times { @product.product_images.build }
  end

  def update
    if @product.update(product_params)
      redirect_to admin_products_path, notice: 'Product was successfully updated.'
    else
      redirect_to edit_admin_product_path, flash: @product.errors.messages
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path, notice: 'Product was successfully deleted.'
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :category_id, :stock_quantity, product_images_attributes: [:id, :image, :is_primary, :_destroy])
  end
end
