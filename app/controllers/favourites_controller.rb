class FavouritesController < ApplicationController

  def index
    @user = User.find params[:id]
  end

  def show
    @favourite = Favourite.find params[:board_id]
  end
end
