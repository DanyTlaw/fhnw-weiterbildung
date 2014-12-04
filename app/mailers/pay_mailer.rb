class PayMailer < ActionMailer::Base
  default from: "fh-weiterbildung@noreply.com"

  def pay_email(user, amount)
  	
  	@url = 'http://fh-weiterbildung.ch/dashboard'
  	@user = User.find(user)
  	@amount = amount
  	attachments['esr.png'] = File.read("#{Rails.root}/public/images/esr.png")
  	mail(to: @user.email, subject: 'Rechnung für weitere Kurserfassungen')

  	redirect_to dashboard_path, notice: "Rechnung wurde per Email gesendet"

  end
end
