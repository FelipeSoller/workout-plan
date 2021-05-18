class Student < ApplicationRecord
  belongs_to :teacher

  has_one :user

  has_many :trainings, dependent: :destroy

  validates :name, presence: true
  validates :name, length: { minimum: 2, maximum: 20 }
end
