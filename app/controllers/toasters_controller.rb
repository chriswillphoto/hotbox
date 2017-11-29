class ToastersController < ApplicationController

  def index
    @toasters = Toaster.all
  end

  def new
    @toaster = Toaster.new
  end

  def create
    params[:toaster][:user_id] = @current_user.id
    @toaster = Toaster.new toaster_params
    if @toaster.save
      redirect_to toasters_path
    else
      render :new
    end
  end

  def show
    @toaster = Toaster.find params[:id]
    @comment = Comment.new
    @comments = @toaster.comments
  end

  def edit
    @toaster = Toaster.find params[:id]
    redirect_to toasters_path unless @toaster.user.id == @current_user || @current_user.admin?
  end

  def update
    toaster = Toaster.find params[:id]
    toaster.update toaster_params
    redirect_to toaster_path(params[:id])
  end

  def destroy
    @toaster = Toaster.find params[:id]
    redirect_to toasters_path unless @toaster.user.id == @current_user || @current_user.admin?
    @toaster.destroy
    redirect_to toasters_path
  end


  private
  def toaster_params
    params.require(:toaster).permit(:model, :manufacturer, :year, :user_id, :image)
  end
end
