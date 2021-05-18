class Training < ApplicationRecord
  belongs_to :student

  has_many :exercises

  validates :title, presence: true
  validates :title, uniqueness: { case_sensitive: false }, length: { minimum: 2, maximum: 20 }
end