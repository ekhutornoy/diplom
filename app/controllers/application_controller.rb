class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_company
    current_user.company
  end
end
