class AddLastAttractionToTour < ActiveRecord::Migration[6.1]
  def change
    add_reference :tours, :last_attraction, foreign_key: { to_table: :attractions}
  end
end
