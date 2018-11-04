class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  protect_from_forgery with: :null_session

  def determine_layout
    module_name = self.class.to_s.split("::").first
    return (module_name.eql?("Devise") ? "admin" : "application")
  end

  private

  def after_sign_in_path_for(resource)
    "/admin"
  end
end 