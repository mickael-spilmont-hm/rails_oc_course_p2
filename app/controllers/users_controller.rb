class UsersController < ApplicationController
  def home
  end

  def login
  end

  def logout
    session[:user_id] = nil
    redirect_to "/users/home"
  end

  def check
    @current_user = User.where(name: params[:name], password: params[:password]).first
    if @current_user
      session[:user_id] = @current_user.id
      flash[:info] = "You are logged in as #{@current_user.name} !"
      redirect_to "/users/home"
    else
      session[:user_id] = nil
      flash[:info] = "Connexion faild"
      redirect_to "/users/login"
    end
  end
end
