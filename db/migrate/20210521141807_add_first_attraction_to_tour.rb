class AddFirstAttractionToTour < ActiveRecord::Migration[6.1]
  def change
    add_reference :tours, :first_attraction, foreign_key: { to_table: :attractions }
  end
end
