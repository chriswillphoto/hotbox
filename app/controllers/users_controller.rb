class UsersController < ApplicationController

  before_action :check_if_admin, :only => [:index]


  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    if params[:user][:image].nil?
      params[:user][:image] = "https://res.cloudinary.com/dyqesnour/image/upload/v1511739515/gen-toaster_fg73fj.jpg"
    else
      cloudinary = Cloudinary::Uploader.upload( params["user"]["image"] )
      params[:user][:image] = cloudinary["secure_url"]
    end
    # raise 'hell'
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = User.find params[:id]
  end

  def edit
    redirect_to root_path unless @current_user.id == params[:id].to_i || @current_user.admin?
    @user = User.find params[:id]
  end

  def update
    user = User.find params[:id]
    unless params[:user][:image].nil?
      cloudinary = Cloudinary::Uploader.upload( params["user"]["image"] )
      params[:user][:image] = cloudinary["secure_url"]
    end
    user.update user_params
    redirect_to user_path(user.id)
  end

  private
  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :image)
  end
end
