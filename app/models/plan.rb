class Plan < ApplicationRecord
  validates :exercise, :sets, :reps, :cadence, :load, :rest, presence: true
end
