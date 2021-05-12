class AddSightseeingTimeToAttraction < ActiveRecord::Migration[6.1]
  def change
    add_column :attractions, :sightseeing_time, :integer
  end
end
