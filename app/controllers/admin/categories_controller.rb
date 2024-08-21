module Admin
  class CategoriesController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource
    before_action :set_category, only: %i[edit update destroy]

    # GET /admin/categories or /admin/categories.json
    def index
      @categories = Category.all.order(id: :asc).page(params[:page]).per(10) # 10 products per page
    end

    # GET /admin/categories/new
    def new
      @category = Category.new
    end

    # GET /admin/categories/1/edit
    def edit; end

    # POST /admin/categories or /admin/categories.json
    def create
      @category = Category.new(category_params)

      respond_to do |format|
        if @category.save
          format.html { redirect_to admin_categories_path, notice: "Category was successfully created." }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /admin/categories/1 or /admin/categories/1.json
    def update
      respond_to do |format|
        if @category.update(category_params)
          format.html { redirect_to admin_categories_path, notice: "Category was successfully updated." }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /admin/categories/1 or /admin/categories/1.json
    def destroy
      @category.destroy

      respond_to do |format|
        format.html { redirect_to admin_categories_url, notice: "Category was successfully destroyed." }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name)
    end
  end
end
