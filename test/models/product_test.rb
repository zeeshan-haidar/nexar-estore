# == Schema Information
#
# Table name: products
#
#  id             :bigint           not null, primary key
#  description    :text
#  name           :string           not null
#  old_price      :decimal(10, 2)
#  price          :decimal(10, 2)   not null
#  stock_quantity :integer          default(0), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  category_id    :integer
#
require "test_helper"

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
