class AddOrderDetailsToPayment < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :order_details, :json
  end
end
