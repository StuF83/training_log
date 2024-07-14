class DailyOverview < ApplicationRecord
  validates :date, uniqueness: true
end
