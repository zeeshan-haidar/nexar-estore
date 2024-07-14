class ChangeImageNullInProductImage < ActiveRecord::Migration[7.0]
  def change
    change_column_null :product_images, :image, true
  end
end
