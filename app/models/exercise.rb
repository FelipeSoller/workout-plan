class Exercise < ApplicationRecord
  belongs_to :training

  accepts_nested_attributes_for :training


  validates :name, :sets, :reps, :rest, :muscle_group, presence: true
  validates :sets, :reps, :rest, numericality: { only_integer: true, greater_than: 0 }
  validates :name, uniqueness: { case_sensitive: false }, length: { minimum: 2, maximum: 20 }
end
