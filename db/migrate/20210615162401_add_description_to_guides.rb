class AddDescriptionToGuides < ActiveRecord::Migration[6.1]
  def change
    add_column :guides, :description, :string
  end
end
