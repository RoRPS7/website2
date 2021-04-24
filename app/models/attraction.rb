class Attraction < ApplicationRecord
  has_and_belongs_to_many :tours
  has_and_belongs_to_many :categories

  validates :name, presence: true
  validates :x, presence: true
  validates :y, presence: true
  validates :price, presence: true
  validates :description, presence: true
end