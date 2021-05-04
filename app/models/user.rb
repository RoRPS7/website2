
class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable
    
    has_and_belongs_to_many :tours

    def username
      return self.email.split('@')[0].capitalize
    end
  end