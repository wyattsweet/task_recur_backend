class Task < ApplicationRecord
  belongs_to :user
  validates_presence_of :user
  validates :title, presence: true
  validates :timeframe, presence: true
  validates :occurrences, presence: true
  enum timeframe: [:daily, :weekly, :monthly]
end
