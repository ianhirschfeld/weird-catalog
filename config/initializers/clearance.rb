Clearance::PasswordsController.layout 'clearance'
Clearance::SessionsController.layout 'clearance'
Clearance::UsersController.layout 'clearance'

Clearance.configure do |config|
  config.mailer_sender = 'get@weirdcatalog.com'
  config.redirect_url = '/admin'
end
