class UserMailer < ApplicationMailer
	default from: "thrkalim@gmail.com"

  def contact_form(email, name, message)
    @message = message
    mail(:from => email,
      :to => 'thrkalim@gmail.com',
      :subject => "A new contact form message from #{name}")
  end

  def new_registration(user)
    @user = user
    mail(:to => user.email, 
      :subject => "Welcome to ´Tahir Books Shop")
  end

  def thank_you(email, name, message)
    @message = message
    mail(:from => 'thrkalim@gmail.com',
      :to => email,
      :subject => "Thank you for your message")
	end
end
