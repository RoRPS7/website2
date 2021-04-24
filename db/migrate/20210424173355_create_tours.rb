class CreateTours < ActiveRecord::Migration[6.1]
  def change
    create_table :tours do |t|
      t.references :guide, null: false, foreign_key: true
      t.references :attraction, null: false, foreign_key: true

      t.timestamps
    end
  end
end
