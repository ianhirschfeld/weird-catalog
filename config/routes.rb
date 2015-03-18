Rails.application.routes.draw do

  root 'static#home'

  get :admin, controller: :admin, action: :show
  namespace :admin do
    resources :catalog_items
    resources :catalog_categories
  end

  ### CLEARANCE ####
  resources :passwords, controller: 'passwords', only: [:create, :new]
  resource :session, controller: 'sessions', only: [:create]

  resources :users, controller: 'users', only: [:create] do
    resource :password,
      controller: 'passwords',
      only: [:create, :edit, :update]
  end

  get '/sign_in' => 'sessions#new', as: 'sign_in'
  delete '/sign_out' => 'sessions#destroy', as: 'sign_out'
  get '/sign_up' => 'users#new', as: 'sign_up'
  ### END CLEARANCE ####

  get 'ci/:id', to: 'catalog_items#show', as: :catalog_item
  get 'category/:category', to: 'static#home', as: :catalog_category

  match '/404', to: 'errors#not_found', via: :all
  match '/422', to: 'errors#unprocessable_entity', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
