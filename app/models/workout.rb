class Workout < ApplicationRecord
  validates :name, :status, presence: true
  has_many :workout_exercises
  has_many :exercises, through: :workout_exercises
  has_many :weekdays
  belongs_to :user

  enum status: [:done, :partial, :missed]

  def self.today
    today = Date.today.strftime('%u')
    self.joins(:weekdays).where("weekdays.id = ?", today)
  end
end
