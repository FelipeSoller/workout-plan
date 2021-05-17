class Student < ApplicationRecord
  belongs_to :teacher

  has_one :user
  has_many :trainings, dependent: :destroy

  validates :name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
end
