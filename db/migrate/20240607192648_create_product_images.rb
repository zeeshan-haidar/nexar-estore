class CreateProductImages < ActiveRecord::Migration[7.0]
  def change
    create_table :product_images do |t|
      t.references :product, null: false, foreign_key: true
      t.string :s3_url, null: false
      t.boolean :is_primary, default: false

      t.timestamps
    end
  end
end
