# == Schema Information
#
# Table name: wished_products
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_wished_products_on_product_id              (product_id)
#  index_wished_products_on_user_id                 (user_id)
#  index_wished_products_on_user_id_and_product_id  (user_id,product_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class WishedProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
