Clearance::PasswordsController.layout 'admin'
Clearance::SessionsController.layout 'admin'
Clearance::UsersController.layout 'admin'

Clearance.configure do |config|
  config.mailer_sender = 'strange@weirdcatalog.com'
  config.redirect_url = '/admin'
end
