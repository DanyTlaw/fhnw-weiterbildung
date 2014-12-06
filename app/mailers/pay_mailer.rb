class PayMailer < ActionMailer::Base
  # Always send from this email
  default from: "fh-weiterbildung@noreply.com"

  def pay_email(user, amount)
  	# Set variables and then send mail with attachments
  	@url = 'http://fh-weiterbildung.ch/dashboard'
  	@user = User.find(user)
  	@amount = amount
  	attachments['esr.png'] = File.read("#{Rails.root}/public/images/esr.png")
  	mail(to: @user.email, subject: 'Rechnung für weitere Kurserfassungen')

  end

  def ad_email(user)
    # Set variables and then send mail with attachments
  	@url = 'http://fh-weiterbildung.ch/dashboard'
  	@user = User.find(user)
  	attachments['esr.png'] = File.read("#{Rails.root}/public/images/esr.png")
  	mail(to: @user.email, subject: 'Rechnung für Werbung')
  end

  def due_email(user, course)
    # Set variables send mail for the courses which are over
  	@url = 'http://fh-weiterbildung.ch/dashboard'
  	@user = User.find(user)
  	@course = Course.find(course)
  	mail(to: @user.email, subject: 'Ihr Kurs ist abgelaufen')
  end	
end
