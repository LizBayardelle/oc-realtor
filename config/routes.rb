Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :blogs
  resources :listings
  resources :home, only: [:index]
  root "home#index"

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:show]

  resources :contacts
  post "contact/:id/archive" => "contacts#archive_contact", as: "archive_contact"
  post "contact/:id/unarchive" => "contacts#unarchive_contact", as: "unarchive_contact"
end
