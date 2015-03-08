Rails.application.routes.draw do

  root 'static#home'

  get :admin, controller: :admin, action: :show
  namespace :admin do
    resources :catalog_items
    resources :catalog_categories
  end

  get 'ci/:id', to: 'catalog_items#show', as: :catalog_item

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
