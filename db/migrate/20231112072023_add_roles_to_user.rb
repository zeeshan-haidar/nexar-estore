class AddRolesToUser < ActiveRecord::Migration[7.0]
  def change
    change_table :users, bulk: true do |t|
      t.boolean :admin_role, default: false, null: false
      t.boolean :user_role, default: true, null: false
    end
  end
end
