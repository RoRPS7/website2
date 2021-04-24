class CreateAttractions < ActiveRecord::Migration[6.1]
  def change
    create_table :attractions do |t|
      t.string :name
      t.float :x
      t.float :y
      t.float :price
      t.string :description
      t.text :time
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
