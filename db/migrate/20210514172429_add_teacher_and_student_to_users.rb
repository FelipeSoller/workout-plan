class AddTeacherAndStudentToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :teacher, foreign_key: true
    add_reference :users, :student, foreign_key: true
  end
end
