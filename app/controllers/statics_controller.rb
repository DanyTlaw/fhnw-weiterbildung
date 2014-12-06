class StaticsController < ApplicationController
  def welcome
    # Just show welcome page
    render :welcome
  end

  def dashboard
    # Dashboard only for logged in users
    authenticate_user!
    render :dashboard
  end

  def pricelist
    # Just show pricelist
    render :pricelist
  end  

  def sendPayMail
    # If user buys courses send mail
    PayMailer.pay_email(params[:user],params[:amount]).deliver
    redirect_to(dashboard_path, :notice => 'Rechnung wurde per Email gesendet')
  end

  def sendAdMail
    # If user buys ad-space send mail
    PayMailer.ad_email(params[:user]).deliver
    redirect_to(dashboard_path, :notice => 'Rechnung wurde per Email gesendet')
  end
end