class Exercise < ApplicationRecord
  belongs_to :trainings

  validates :name, :sets, :reps, :rest, :muscle_group, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
