class Training < ApplicationRecord
  belongs_to :student

  has_many :exercises

  accepts_nested_attributes_for :student
  accepts_nested_attributes_for :exercises, allow_destroy: true

  validates :title, presence: true
  # validates :title, uniqueness: { case_sensitive: false }, length: { minimum: 2, maximum: 20 }
end