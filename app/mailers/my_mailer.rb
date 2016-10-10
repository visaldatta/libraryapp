class MyMailer < ApplicationMailer

  default from: 'libraryncsuwolfpack@gmail.com'
 
  def welcome_email(booking, email)
    @booking = booking
    @email = email
    mail(to: @email, subject: 'Booking Notification')
  end

end
