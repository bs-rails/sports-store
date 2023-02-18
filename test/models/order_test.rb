# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  address    :string
#  city       :string
#  name       :string
#  shipped    :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cart_id    :bigint           not null
#
# Indexes
#
#  index_orders_on_cart_id  (cart_id)
#
# Foreign Keys
#
#  fk_rails_...  (cart_id => carts.id)
#
require "test_helper"

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
