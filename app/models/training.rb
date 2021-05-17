class Training < ApplicationRecord
  belongs_to :student, dependent: :destroy

  has_many :exercises

  validates :title, presence: true
end