class ApplicationController < ActionController::Base
  include Pundit

  private

  delegate :teacher, to: :current_user, prefix: :current, allow_nil: true
  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    def user_not_authorized
        flash[:notice] = "Access denied. You must be teacher to access this area"
        redirect_to(request.referrer || root_path)
    end
end
