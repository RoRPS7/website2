class CreateGuides < ActiveRecord::Migration[6.1]
  def change
    create_table :guides do |t|
      t.string :name
      t.text :surname
      t.integer :telnumber

      t.timestamps
    end
  end
end
