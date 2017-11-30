class UpvotesController < ApplicationController

  def create
    @upvote = Upvote.new
    @upvote.user_id = @current_user.id
    @upvote.custom_id = params[:id]
    @upvote.save
    redirect_to custom_path(@upvote.custom_id)
  end

  def destroy
    upvote = Upvote.where(custom_id: params[:id], user_id: @current_user.id).first
    upvote.destroy
    redirect_to custom_path(upvote.custom_id)
  end

  # private
  # def upvotes_params
  #   params.require(:upvote).permit(:user_id, :custom_id)
  # end
end
