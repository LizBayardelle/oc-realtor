Rails.application.routes.draw do
  get 'tags/:tag', to: 'blogs#index', as: :tag
  resources :listings
  resources :home, only: [:index]
  root "home#index"

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:show]

  resources :contacts
  post "contact/:id/archive" => "contacts#archive_contact", as: "archive_contact"
  post "contact/:id/unarchive" => "contacts#unarchive_contact", as: "unarchive_contact"

  resources :blogs
  post "users/:id/subscribe_to_blog" => "users#subscribe_to_blog", as: "subscribe_to_blog"
end
