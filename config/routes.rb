Rails.application.routes.draw do

  root 'static#home'

  get :admin, controller: :admin, action: :show
  namespace :admin do
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
