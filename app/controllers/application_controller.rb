class ApplicationController < ActionController::Base
  private

  delegate :teacher, to: :current_user, prefix: :current, allow_nil: true
end
