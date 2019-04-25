class Report < ApplicationRecord
  
  ##
  # Check uniqueness and presence of report objects before putting them in the DB
  validates :user_identifier, presence: true, uniqueness: true 

  belongs_to :school

end
