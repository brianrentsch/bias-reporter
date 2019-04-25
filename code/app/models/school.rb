class School < ApplicationRecord
  before_save { self.name = name.downcase }  #downcase institution name, for the sake of consistency
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 50 }
  validates :address, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 100 } 
  validates :city, presence: true, length: { maximum: 30 }
  validates :state, presence: true, length: { maximum: 20 }
  validates :zip_code, presence: true, length: { maximum: 15 }
  validates :email, length: { maximum: 200 }
  validates :password, presence: true, length: { minimum: 6 }

  has_secure_password

  ##
  # Return the hash digest of a given string
  def School.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
end
