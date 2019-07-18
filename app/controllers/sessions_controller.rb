class SessionsController < ApplicationController

  def new
    @user = User.new
    render :login
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to users_path
    else
      flash.now[:danger] = 'Invalid username/password combination'
      render :login
    end
  end

  def oauth
    user = User.find_or_create_by_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_path
  end


  def destroy
      session.clear
      redirect_to '/'
  end

  protected

  def auth
    request.env['omniauth.auth']
  end


end
