class HomeController < ApplicationController
  def index

  end
  def about_us

  end

  def search
    @search_users = User.where('lower(fname) = ?', params[:query].downcase)
  end
end
