class Guide < ApplicationRecord
  has_many :tours

  validates :name, presence: true
  validates :surname, presence: true
  validates :telnumber, length: { minimum: 9 }
end