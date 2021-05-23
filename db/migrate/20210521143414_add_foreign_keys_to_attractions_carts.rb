class AddForeignKeysToAttractionsCarts < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key "attractions_carts", "attractions"
    add_foreign_key "attractions_carts", "carts"
  end
end
