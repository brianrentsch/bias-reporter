class School < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 50 }
  validates :address, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 100 } 
  validates :city, presence: true, length: { maximum: 30 }
  validates :state, presence: true, length: { maximum: 20 }
  validates :zip_code, presence: true, length: { maximum: 15 }
  validates :email, length: { maximum: 200 }
  
end
