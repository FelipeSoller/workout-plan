class MuscleGroup < ApplicationRecord
  has_many :plans
  belongs_to :client
end
