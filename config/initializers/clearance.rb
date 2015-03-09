require 'mail'

Clearance::PasswordsController.layout 'clearance'
Clearance::SessionsController.layout 'clearance'
Clearance::UsersController.layout 'clearance'

Clearance.configure do |config|
  address = Mail::Address.new 'get@weirdcatalog.com'
  address.display_name = 'Weird Catalog'
  config.mailer_sender = address.format
  config.redirect_url = '/admin'
end
