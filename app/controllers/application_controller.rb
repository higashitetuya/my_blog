class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resource)
    if resource.class == Customer
      my_page_path(@user.id)
    else
      admin_path
    end
  end

  def after_sign_in_path_for(resource)
    if resource.class == User
      my_page_path(@user.id)
    else
      admin_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    return root_path if resource_or_scope == :customer
    new_admin_session_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :blog, :age, :birthday, :sign, :location, :hobby, :introduction])
  end
end
