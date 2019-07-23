class SessionsController < ApplicationController

  def new
    @user = User.new
    render :login
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      log_in(@user)
      redirect_to user_path(@user)
    else
      #flash.now[:danger] = 'Invalid username/password combination'
      render :login
    end
  end

  def gitcreate
    @user = User.find_or_create_from_omniauth(auth)
    log_in(@user)
    redirect_to user_path(@user)
  end


  def auth
    request.env['omniauth.auth']
  end



  def destroy
      session.clear :user_id
      redirect_to '/'
  end


end
