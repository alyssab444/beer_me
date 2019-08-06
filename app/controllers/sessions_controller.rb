class SessionsController < ApplicationController

  def new
    @user = User.new
    render :login
  end

  #def create
  #  @user = User.find_by(username: params[:user][:username])
  #  if @user && @user.authenticate(params[:user][:password])
    #  log_in(@user)
    #  redirect_to user_path(@user)
  #  else
    #  render :login
  #  end
#  end


  def create
    if
      auth_hash = request.env["omniauth.auth"]
      @user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id] = @user.id
    redirect_to user_path
    else
      @user = User.find_by(username: params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
      log_in(@user)
      redirect_to user_path(@user)
    else
      render :login
    end
  end
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
