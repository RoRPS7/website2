class Tour < ApplicationRecord
  belongs_to :guide, optional: true
  belongs_to :discount, optional: true
  has_and_belongs_to_many :attractions
  belongs_to :attraction_start, :class_name => "Attraction"
  belongs_to :attraction_end, :class_name => "Attraction"
  has_and_belongs_to_many :users
end
