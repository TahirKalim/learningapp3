
class UserMailer < ApplicationMailer
  default from: "thrkalim@gmail.com"

  def contact_form(email, name, message)    @message = message
    mail(:from => email,
        :to => 'thrkalim@gmail.com',
        :subject => "A new contact form message from #{name}")
  end

  def welcome(user)
    @appname = "Bike Frankfurt"
    mail(:to => user.email, :subject => "Welcome to #{@appname}!")
  end

end
