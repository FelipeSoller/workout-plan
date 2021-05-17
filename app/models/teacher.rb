class Teacher < ApplicationRecord
  has_one :user
  has_many :students

  validates :name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
end