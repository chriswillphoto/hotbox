class WallpostsController < ApplicationController

  def create
    params[:wallpost][:user_id] = @current_user.id
    @wallpost = Wallpost.new wallpost_params
    @wallpost.save
    redirect_to custom_path(@wallpost.custom)
  end


  private
  def wallpost_params
    params.require(:wallpost).permit(:message, :user_id, :custom_id)
  end
end
