class UsersController < ApplicationController
  
  def index
    redirect_to new_user_path
  end
  
  def new
    @user = User.new 
  end   
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "Thanks for signing up!"
    else
      render "new" 
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  private
    def user_params
        params.require(:user).permit(:name, :email, :password,
                                     :password_confirmation)
    end
end
