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

  def sendPayMail
    PayMailer.pay_email(params[:user],params[:amount]).deliver
    redirect_to(dashboard_path, :notice => 'Rechnung wurde per Email gesendet')
  end

  def pricelist
      render :pricelist
  end
end