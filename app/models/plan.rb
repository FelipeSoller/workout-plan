class Plan < ApplicationRecord
  validates :exercise, :sets, :reps, :cadence, :load, :rest, presence: true
  validates :exercise, uniqueness: { case_sensitive: false }
end
