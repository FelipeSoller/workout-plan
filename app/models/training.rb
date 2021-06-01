class Training < ApplicationRecord
  belongs_to :student

  has_many :exercises, dependent: :destroy

  accepts_nested_attributes_for :student
  accepts_nested_attributes_for :exercises, allow_destroy: true

  validates :title, presence: true
  validates :title, length: { minimum: 5, maximum: 20 }
end