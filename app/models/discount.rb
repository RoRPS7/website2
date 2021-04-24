class Discount < ApplicationRecord
  validates :name, presence: true
  validates :percent, presence: true
end
