class HomeController < ApplicationController

  def index    
    if current_user == nil
return
    elsif current_user.profile == 'teacher'
      @user_profile = current_user.profile
      @user = current_user.teacher
    else
      @user_profile = current_user.profile
      @user = current_user.student
      @teacher = current_user.student.teacher
    end
  end
end
