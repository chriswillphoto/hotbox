class PagesController < ApplicationController

  def home
    @users = User.all
    @customs = Custom.all
  end

end
