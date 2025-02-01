class Users::RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)

    if resource.save
      sign_up(resource_name, resource)
      redirect_to root_path, notice: "サインアップが完了しました！"
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource, status: :unprocessable_entity    
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
