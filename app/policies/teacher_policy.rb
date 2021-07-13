class TeacherPolicy < ApplicationPolicy
  def index?
    if user.profile == "teacher"
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
  
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
