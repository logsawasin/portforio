class Users::UsersController < ApplicationController
    def index
        @user = User.all
    end
    
    def show
        @user = User.find(params[:id])
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to user_path(params[:id])
    end
    
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to top_path
    end
    
    private
    
    def user_params
        params.require(:user).permit(:name, :image)
    end
end
