class CustomsController < ApplicationController

  def new
    if @current_user == nil then redirect_to login_path end
    @custom = Custom.new
  end

  def create
    params[:custom][:user_id] = @current_user.id
    @custom = Custom.new customs_params
    if @custom.save
      redirect_to user_path(@custom.user)
    else
      render :new
    end
  end

  def edit
    @custom = Custom.find params[:id]
    redirect_to toasters_path unless @custom.user == @current_user || @current_user.admin?
  end

  def update
    custom = Custom.find params[:id]
    custom.update customs_params
    redirect_to user_path(custom.user)
  end

  def destroy
    custom = Custom.find params[:id]
    custom.destroy
    redirect_to user_path(custom.user)
  
  end


  private
  def customs_params
    params.require(:custom).permit(:name, :image, :toaster_id, :user_id, :description)
  end
end
