class UserMailer < Devise::Mailer
  helper :application
  include Devise::Controllers::UrlHelpers 
  default template_path: 'devise/mailer'

  def confirmation_instructions(record, token, opts={})
    opts[:from] = 'codemoji@gmail.com'
    opts[:reply_to] = 'codemoji@gmail.com'
    mail(to: @user.email, subject: "Welcome to Codemoji, please confirm your account")
    super
  end

  def password_change(record, token, opts={})
    opts[:from] = 'codemoji@gmail.com'
    opts[:reply_to] = 'codemoji@gmail.com'
    mail(to: @user.email, subject: "Someone reset your password, sure hope it was you!")
    super
  end

  def reset_password(record, token, opts={})
    opts[:from] = 'codemoji@gmail.com'
    opts[:reply_to] = 'codemoji@gmail.com'
    mail(to: @user.email, subject: "So, you need to reset your password, eh?")
    super
  end

  def unlock_instructions(record, token, opts={})
    opts[:from] = 'codemoji@gmail.com'
    opts[:reply_to] = 'codemoji@gmail.com'
    mail(to: @user.email, subject: "Got locked out? We can help.")
    super
  end

end
