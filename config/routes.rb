Rails.application.routes.draw do
  # Use Device for authentication
  devise_for :users, controllers: { registrations: 'registrations', confirmations: 'confirmations', sessions: 'users/sessions' }
  
  # Set root page
  root to: 'home#index'

  # Use RESTful routes
  get "users/show" => "users#show"
  get 'articles/index'
  get "search", to:"courses#search"
  get "teachers" => "inquiries#new"
  
  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
    get '/users/password', to: 'devise/passwords#new'
  end
  resources :articles
  resources :comments
  resources :courses do
    resources :posts
  end
  resources :courses do
    resources :chapters
  end
  resources :articles do
    resources :comments
  end
  
  # Single pages
  get "about" => 'home#about'
  get "inactive-sign-up" => 'home#inactive-sign-up'
  get "account-confirmed" => 'home#account-confirmed'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
