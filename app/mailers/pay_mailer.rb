class PayMailer < ActionMailer::Base
  default from: "fh-weiterbildung@noreply.com"

  def pay_email(user)
  	@user = user
  	@url = 'http://fh-weiterbildung.ch/dashboard'
  	mail(to: @user.email, subject: 'Rechnung für weitere Kurserfassungen')

  	attachments['esr.png'] = File.read("#{Rails.root}/public/images/esr.png")

  end
end
