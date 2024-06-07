class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description
      t.decimal :price, precision: 10, scale: 2, null: false
      t.decimal :old_price, precision: 10, scale: 2
      t.integer :category_id
      t.integer :stock_quantity, default: 0, null: false

      t.timestamps
    end
  end
end
