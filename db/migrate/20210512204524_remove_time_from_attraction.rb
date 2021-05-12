class RemoveTimeFromAttraction < ActiveRecord::Migration[6.1]
  def change
    remove_column :attractions, :time
  end
end
