class Student < ApplicationRecord
  belongs_to :teacher

  has_one :user, dependent: :destroy

  has_many :trainings

  accepts_nested_attributes_for :user

  validates :name, presence: true
  validates :name, length: { minimum: 2, maximum: 20 }

  scope :ordered, -> { order(name: :asc) }
end
