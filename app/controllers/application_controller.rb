class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters , if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name_kana, :first_name_kana, :last_name, :first_name, :postal_code, :address, :telephone_number])
  end

  def after_sign_in_path_for(resource)
      if admin_signed_in?
       admin_homes_top_path
      else customer_signed_in?
       public_homes_top_path
      end
  end

  def after_sign_out_path_for(resource)
      if resource == :admin
          new_admin_session_path
      else
          public_homes_top_path
      end      
  end 
 end
