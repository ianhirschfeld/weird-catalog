Rails.application.routes.draw do

  root 'static#home'

  get :admin, controller: :admin, action: :show
  namespace :admin do
    resources :catalog_items
    resources :catalog_categories
  end

  get 'ci/:id', to: 'catalog_items#show', as: :catalog_item
  get 'category/:category', to: 'static#home', as: :catalog_category

  match '/404', to: 'errors#not_found', via: :all
  match '/422', to: 'errors#unprocessable_entity', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
