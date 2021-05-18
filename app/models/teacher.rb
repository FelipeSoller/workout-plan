class Teacher < ApplicationRecord
  has_one :user

  has_many :students

  accepts_nested_attributes_for :user

  validates :name, presence: true
  validates :name, length: { minimum: 2, maximum: 20 }
end