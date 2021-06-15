class ToursGuideIdNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :tours, :guide_id, true
    change_column_default :tours, :guide_id, from: true, to: false
  end
end
