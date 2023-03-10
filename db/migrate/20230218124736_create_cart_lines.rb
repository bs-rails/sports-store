class CreateCartLines < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_lines do |t|
      t.references :product, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true
      t.integer :quantity, default: 1

      t.timestamps
    end
  end
end
