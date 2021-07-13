class TrainingPolicy < ApplicationPolicy
  def index?
    if 
      true
    end
  end

  def show?
    if user.profile == "teacher"
      true
    end
  end

  def new?
    if user.profile == "teacher"
      true
    end
  end

  def edit?
    if user.profile == "teacher"
      true
    end
  end

  def destroy?
    if user.profile == "teacher"
      true
    end
  end  

  def student(student_id)
    @student ||= if user.profile == 'student'
      user.student
    else  
      Student.find(student_id)
    end
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.by_student(students)
    end

    private 

    def by_student(students)
      Training.where(student: student)
    end

    def students
      @students ||= if user.profile == 'student'
        [user.student]
      else
        user.teacher.students
      end
    end
  end
end