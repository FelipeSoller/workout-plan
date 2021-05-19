class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  belongs_to :teacher, optional: true
  belongs_to :student, optional: true

  validate :ensure_that_no_student_and_teacher_at_the_same_time

  # def password
  #   @password ||= '123456'
  #   @password_confirmation ||= '123456'
  # end

  def teacher?
    profile == 'teacher'
  end

  def student?
    profile == 'student'
  end

  private

  def ensure_that_no_student_and_teacher_at_the_same_time
    if teacher? && student
      errors.add :student_id, :absent
    elsif student? and teacher
      errors.add :teacher_id, :absent
    end
  end
end
