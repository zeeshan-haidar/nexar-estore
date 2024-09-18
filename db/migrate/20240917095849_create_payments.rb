class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.string :title
      t.integer :price
      t.string :stripe_payment_id
      t.string :status

      t.timestamps
    end
  end
end
