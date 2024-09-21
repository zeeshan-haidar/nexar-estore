class AddShppingAddressToPayment < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :shipping_address, :string
  end
end
