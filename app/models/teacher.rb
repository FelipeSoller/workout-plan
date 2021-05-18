class Teacher < ApplicationRecord
  has_one :user
  has_many :students

  validates :name, presence: true
  validates :name, length: { minimum: 2, maximum: 20 }
end