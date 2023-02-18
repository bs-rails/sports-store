# == Schema Information
#
# Table name: cart_lines
#
#  id         :bigint           not null, primary key
#  quantity   :integer          default(1)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cart_id    :bigint           not null
#  product_id :bigint           not null
#
# Indexes
#
#  index_cart_lines_on_cart_id     (cart_id)
#  index_cart_lines_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (cart_id => carts.id)
#  fk_rails_...  (product_id => products.id)
#
class CartLine < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  after_save { self.destroy if quantity < 1 }

  def price
    quantity * product.price
  end
end
