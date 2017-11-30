class ToastersController < ApplicationController

  def index
    @toasters = case params[:sort]
    when nil then Toaster.all
    when "model" then Toaster.all.order(model: :asc)
    when "manufacturer" then Toaster.all.order(manufacturer: :asc)
    when "rating" then Toaster.all.order(score: :desc)
    end
    # @toasters = Toaster.all.sort_by {|t| eval(sortable)}
    # @toasters = Toaster.all.order(sortable: asc )
    # raise 'hell'
  end

  def new
    @toaster = Toaster.new
  end

  def create
    if params[:toaster][:image].nil?
      params[:toaster][:image] = "https://res.cloudinary.com/dyqesnour/image/upload/v1511739515/gen-toaster_fg73fj.jpg"
    else
      cloudinary = Cloudinary::Uploader.upload(params["toaster"]["image"], :width => 1000, :height => 1000, :crop => :pad)
      params[:toaster][:image] = cloudinary["secure_url"]
    end
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
    redirect_to toasters_path unless @toaster.user == @current_user || @current_user.admin?
  end

  def update
    toaster = Toaster.find params[:id]
    unless params[:toaster][:image].nil?
      cloudinary = Cloudinary::Uploader.upload(params["toaster"]["image"], :width => 1000, :height => 1000, :crop => :pad)
      params[:toaster][:image] = cloudinary["secure_url"]
    end
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
    params.require(:toaster).permit(:model, :manufacturer, :year, :user_id, :image, :description)
  end
end
