class Task < ApplicationRecord
  belongs_to :user
  enum timeframe: [:daily, :weekly, :monthly]
end
