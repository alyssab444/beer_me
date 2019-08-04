class SessionsController < ApplicationController

  def new
    @user = User.new
    render :login
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      log_in(@user)
      redirect_to user_path(@user)
    else
      render :login
    end
  end

  def gitcreate
    @user = User.create_with_omniauth(auth)
    session[:user_id] = @user.id
    redirect_to user_path
    end


  def destroy
      session.clear
      redirect_to '/'
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
