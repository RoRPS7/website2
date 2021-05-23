class CreateCartsAttractionsJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :carts, :attractions
  end
end