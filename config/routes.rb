Rails.application.routes.draw do

  get 'test/hero'

  get 'tags/:tag', to: 'blogs#index', as: :tag
  resources :listings
  resources :home, only: [:index]
  root "home#index"
  get "test/hero"

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:show]
  post "user/:id/archive" => "users#archive_client", as: "archive_client"
  post "user/:id/unarchive" => "users#unarchive_client", as: "unarchive_client"
  post "user/:id/confirm" => "users#confirm_client", as: "confirm_client"
  post "user/:id/unconfirm" => "users#unconfirm_client", as: "unconfirm_client"


  resources :contacts
  post "contact/:id/archive" => "contacts#archive_contact", as: "archive_contact"
  post "contact/:id/unarchive" => "contacts#unarchive_contact", as: "unarchive_contact"

  resources :blogs do
    resources :comments
  end
  post "users/:id/subscribe_to_blog" => "users#subscribe_to_blog", as: "subscribe_to_blog"
  post "comment/:id/approve" => "comments#approve_comment", as: "approve_comment"
  post "comment/:id/unapprove" => "comments#unapprove_comment", as: "unapprove_comment"

  resources :values
  post "value/:id/archive" => "values#archive_value", as: "archive_value"
  post "value/:id/unarchive" => "values#unarchive_value", as: "unarchive_value"
end
