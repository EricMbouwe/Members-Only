Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'posts#index'
  resources :posts, only: [:new, :create, :index]
  resources :users
  
end
