class UsersController < ApplicationController


  #loading the signup form
  def new
    if logged_in?
       redirect_to user_path(current_user)
     else
       @user = User.new
     end
  end

  #signup
  def create
    @user = User.new(user_params)
      if @user.save
        #login the user
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        render :new
      end
  end

  def show
    @user = User.find_by(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
