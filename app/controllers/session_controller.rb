class SessionController < ApplicationController
  def new
  end

  def create
    if params[:login].include? "@"
      user = User.find_by :email => params[:login]
    else
      user = User.find_by :username => params[:login]
    end

    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = "Invalid Login Details/Password"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil

  end


end
