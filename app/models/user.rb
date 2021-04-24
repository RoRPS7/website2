class User < ApplicationRecord
  include Clearance::User

  has_and_belongs_to_many :tours

  validates :login, presence: true
  validates :password, presence: true
end
