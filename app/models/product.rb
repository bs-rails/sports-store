# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  price       :decimal(8, 2)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#
# Indexes
#
#  index_products_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
class Product < ApplicationRecord
  belongs_to :category
  has_many :cart_lines

  before_destroy :ensure_not_referenced_by_any_cart_line

  validates :name, length: { minimum: 5 }, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0.00 }

  private

  def ensure_not_referenced_by_any_cart_line
    unless cart_lines.empty?
      errors.add(:base, "Cart lines present")
      throw :abort
    end
  end
end
