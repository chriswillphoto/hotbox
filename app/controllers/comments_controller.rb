class CommentsController < ApplicationController

  def create
    params[:comment][:user_id] = @current_user.id
    @comment = Comment.new comment_params
    @toaster = Toaster.find @comment.toaster.id
    @toaster.update :rating => @toaster.rating + @comment.rating, :ratings => @toaster.ratings + 1

    if @comment.save
      redirect_to toaster_path(@comment.toaster.id)
    else
    end
  end

  def edit
    @comment = Comment.find params[:id]
    unless @comment.user == @current_user || @current_user.admin?
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    comment = Comment.find params[:id]
    comment.update comment_params
    redirect_to toaster_path(comment.toaster_id)
  end

  def destroy
    comment = Comment.find params[:id]
    toaster = comment.toaster.id
    comment.destroy
    redirect_to toaster_path(toaster)
  end

  private
  def comment_params
    params.require(:comment).permit(:title, :body, :rating, :user_id, :toaster_id)
  end
end
