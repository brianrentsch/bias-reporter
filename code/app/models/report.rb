class Report < ApplicationRecord
  validates :user_identifier, presence: true, uniqueness: true

end
