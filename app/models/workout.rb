class Workout < ApplicationRecord
INTENSITY = %w[low moderate high]

  validates :workout_type, presence: true
  validates :duration, presence: true, numericality: { greater_than: 0 } 
  validates :intensity, presence: true, inclusion: { in: INTENSITY, message: "%{value} is not a valid intensity" }
  validates :date, presence: true
  validate :date_cannot_be_in_the_future

  def date_cannot_be_in_the_future
    if date.present? && date > Date.today
      errors.add(:date, "Workout date cannot be in the future")
    end
  end
end