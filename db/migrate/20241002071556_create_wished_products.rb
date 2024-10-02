class CreateWishedProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :wished_products do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end

    add_index :wished_products, [:user_id, :product_id], unique: true
  end
end
