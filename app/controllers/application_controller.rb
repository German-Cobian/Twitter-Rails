class ApplicationController < ActionController::Base
  before_action :redirect_to_username_form, if: -> { user_signed_in? && current_user.username.blank? }
  protected

  def after_sign_in_path_for(resource)
    dashboard_path
  end

  def redirect_to_username_form
    redirect_to new_username_path
  end

  def previous_path
    @previous_path ||= Rails.application.routes.recognize_path(request.referrer)
  end

  def previous_controller_name
    previous_path[:controller]
  end

  helper_method :previous_controller_name

  def previous_action_name
    previous_path[:action]
  end
  helper_method :previous_action_name
end
