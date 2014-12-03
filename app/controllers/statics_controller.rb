class StaticsController < ApplicationController
  def welcome
    render :welcome
  end

  def home
  	render :home
  end

  def dashboard
    authenticate_user!
    render :dashboard
  end

end