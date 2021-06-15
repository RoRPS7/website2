class AddDiscountIdToTours < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :tours, :discounts
  end
end
