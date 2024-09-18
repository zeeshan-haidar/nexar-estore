class ChangePriceToDecimalInPayment < ActiveRecord::Migration[7.0]
  def change
    change_column :payments, :price, :decimal, precision: 10, scale: 2, null: false
  end
end
