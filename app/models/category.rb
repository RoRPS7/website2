class Category < ApplicationRecord
  has_and_belongs_to_many :attractions

  validates :name, presence: true
  validates :description, presence: true
end