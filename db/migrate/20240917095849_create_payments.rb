class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.string :title
      t.decimal :price, precision: 10, scale: 2
      t.string :stripe_payment_id
      t.string :status

      t.timestamps
    end
  end
end
