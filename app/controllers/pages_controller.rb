class PagesController < ApplicationController

  def home
    @users = User.all
    @customs = Custom.all.sample(5)
  end

end
