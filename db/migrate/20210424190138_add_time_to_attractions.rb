class AddTimeToAttractions < ActiveRecord::Migration[6.1]
  def change
    add_column :attractions, :time, :string
  end
end
