class PayMailer < ActionMailer::Base
  default from: "fh-weiterbildung@noreply.com"

  def pay_email(user, amount)
  	
  	@url = 'http://fh-weiterbildung.ch/dashboard'
  	@user = User.find(user)
  	@amount = amount
  	attachments['esr.png'] = File.read("#{Rails.root}/public/images/esr.png")
  	mail(to: @user.email, subject: 'Rechnung für weitere Kurserfassungen')

  end

  def ad_email(user)
  	@url = 'http://fh-weiterbildung.ch/dashboard'
  	@user = User.find(user)
  	attachments['esr.png'] = File.read("#{Rails.root}/public/images/esr.png")
  	mail(to: @user.email, subject: 'Rechnung für Werbung')
  end

  def due_email(user, course)
  	@url = 'http://fh-weiterbildung.ch/dashboard'
  	@user = User.find(user)
  	@course = Course.find(course)
  	mail(to: @user.email, subject: 'Ihr Kurs ist abgelaufen')
  end	
end
