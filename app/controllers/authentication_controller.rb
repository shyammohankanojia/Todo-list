class AuthenticationController < ApplicationController
  def new
  end

  def login
    user = User.find_by_login(params[:username])
    if user && user.password == params[:password]
      authenticate(user)
      redirect_to tasks_url, :notice => 'You are in dude!'
    else
      flash[:error] = "Username and password don't match"
      redirect_to :action => :new
    end
  end

  def logout
    session.delete(:user_id)
    redirect_to :action => :new
  end

end
