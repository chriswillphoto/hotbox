class FavouritesController < ApplicationController

  def index
    @user = User.find params[:id]
    @favourite = Favourite.new
  end

  def show
    @favourite = Favourite.find params[:board_id]
  end

  def create
    params[:favourite][:user_id] = @current_user.id
    @favourite = Favourite.create favourite_params

    redirect_back(fallback_location: user_path(@current_user))
  end

  def update
    @favourite = Favourite.find params[:board_id]
    @custom = Custom.find params[:custom_id]

    unless @favourite.customs.include? @custom
      @favourite.customs << @custom
      redirect_to custom_path(@custom.id)
    else
      @favourite.customs.delete(@custom)
      @custom.favourites.delete(@favourite)
      redirect_to custom_path(@custom.id)
    end
  end

  private
  def favourite_params
    params.require(:favourite).permit(:name, :user_id)
  end
end
