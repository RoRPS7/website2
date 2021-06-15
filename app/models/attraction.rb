class Attraction < ApplicationRecord
  has_and_belongs_to_many :tours
  has_and_belongs_to_many :categories
  has_many :primary_tours, :class_name => "Tour", :foreign_key => "attraction_start_id"
  has_many :secondary_tours, :class_name => "Tour", :foreign_key => "attraction_end_id"
  has_one_attached :image

  # paginates_per 4

  validates :name, presence: true
  validates :x, presence: true
  validates :y, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :sightseeing_time, presence: true
end