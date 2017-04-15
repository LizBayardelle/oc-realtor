Rails.application.routes.draw do
  resources :home, only: [:index]
  get 'home/about'
  root "home#index"

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:show]

end
