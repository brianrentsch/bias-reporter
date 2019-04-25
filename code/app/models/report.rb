# Racial Bias Reporter #
# Project Description: Web-app to allow victims of on-campus racial bias
# to report these incidents to their schools, and track the
# resolution.
# File Description: model file of the Report DB entity
# Auto-Generated?: Created and modified by me.

class Report < ApplicationRecord
  
  ##
  # Check uniqueness and presence of report objects before putting them in the DB
  validates :user_identifier, presence: true, uniqueness: true, length: { maximum: 20 } 
  validates :date, presence: true 
  validates :time, length: { maximum: 10 }
  validates :location, presence: true, length: { maximum: 50 }
  validates :details, presence: true, length: { maximum: 255 }
  validates :status, length: { maximum: 255 }
  validates :school_id, presence: true

  belongs_to :school

end
