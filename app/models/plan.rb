class Plan < ApplicationRecord
  belongs_to :muscle_group

  validates :exercise, :sets, :reps, :cadence, :rest, :muscle_group_id, presence: true
  validates :exercise, uniqueness: { case_sensitive: false }
end
