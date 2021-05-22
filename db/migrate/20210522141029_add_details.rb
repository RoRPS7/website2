class AddDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :tours, :attraction_start_id, :integer
    add_column :tours, :attraction_end_id, :integer
  end
end
