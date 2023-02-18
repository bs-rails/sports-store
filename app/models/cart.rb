# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Cart < ApplicationRecord
  has_many :cart_lines, dependent: :destroy

  def total_price
    cart_lines.sum(&:price)
  end

  def has_product(product)
    cart_lines.each do |line|
      return true if line.product.id == product.id
    end
    false
  end
end
