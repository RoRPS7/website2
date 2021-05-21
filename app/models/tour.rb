class Tour < ApplicationRecord
  belongs_to :guide
  has_and_belongs_to_many :attractions
  has_and_belongs_to_many :users
end
