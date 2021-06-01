class Exercise < ApplicationRecord
  belongs_to :training

  validates :name, :sets, :reps, :rest, :muscle_group, presence: true
  validates :sets, :reps, :rest, numericality: { only_integer: true, greater_than: 0 }
end
