class UserMailer < Devise::Mailer
  helper :application
  include Devise::controller::URLHelpers
  default template_path: 'devise/mailer'
  
  def confirmation_email
end
