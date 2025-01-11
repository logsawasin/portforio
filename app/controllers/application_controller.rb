class ApplicationController < ActionController::Base
    class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
    end
    private
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end

end
