class AddOmniauthToUsers < ActiveRecord::Migration[7.0]
  # rubocop:disable Rails/BulkChangeTable
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :name, :string
    add_column :users, :image, :text
  end
  # rubocop:enable Rails/BulkChangeTable
end
