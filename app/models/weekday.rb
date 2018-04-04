class Weekday < ApplicationRecord
  validates :name, presence: true
  belongs_to :workout

end
