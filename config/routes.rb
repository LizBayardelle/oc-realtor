Rails.application.routes.draw do
  resources :home, only: [:index]
  get 'home/about'
  root "home#index"

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:show]

  resources :contacts
  post "contact/:id/archive" => "contact#archive", as: "archive_contact"
  post "contact/:id/unarchive" => "contact#unarchive", as: "unarchive_contact"
end
