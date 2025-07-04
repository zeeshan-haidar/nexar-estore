# == Schema Information
#
# Table name: payments
#
#  id                :bigint           not null, primary key
#  order_details     :json
#  price             :decimal(10, 2)   not null
#  shipping_address  :string
#  status            :string
#  title             :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  stripe_payment_id :string
#  user_id           :bigint           not null
#
# Indexes
#
#  index_payments_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Payment < ApplicationRecord
  belongs_to :user
end
