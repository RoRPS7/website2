class Guide < ApplicationRecord
  has_many :tours
  has_one_attached :image
  
  validates :name, presence: true
  validates :surname, presence: true
  validates :telnumber, length: { minimum: 9 }

  def name_and_surname
    "#{name} #{surname}"
  end
end