Rails.application.routes.draw do

  resources :home, only: [:index]
  root "home#index"

  resources :quicks
  post "quick/:id/archive" => "quicks#archive_quick", as: "archive_quick"
  post "quick/:id/unarchive" => "quicks#unarchive_quick", as: "unarchive_quick"
  post "quick/:id/make_responded" => "quicks#make_responded", as: "make_responded"
  post "quick/:id/make_unresponded" => "quicks#make_unresponded", as: "make_unresponded"
  post "quick/:id/quick_read" => "quicks#quick_read", as: "quick_read"
  post "quick/:id/quick_unread" => "quicks#quick_unread", as: "quick_unread"


  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:show]
  post "user/:id/archive" => "users#archive_client", as: "archive_client"
  post "user/:id/unarchive" => "users#unarchive_client", as: "unarchive_client"
  post "user/:id/confirm" => "users#confirm_client", as: "confirm_client"
  post "user/:id/unconfirm" => "users#unconfirm_client", as: "unconfirm_client"

  get 'test/hero'

  resources :buyers
  post "user/:id/archive" => "users#archive_buyer", as: "archive_buyer"
  post "user/:id/unarchive" => "users#unarchive_buyer", as: "unarchive_buyer"

  resources :intakes
  resources :listings

  resources :contacts
  post "contact/:id/archive" => "contacts#archive_contact", as: "archive_contact"
  post "contact/:id/unarchive" => "contacts#unarchive_contact", as: "unarchive_contact"

  resources :blogs do
    resources :comments
  end
  get 'tags/:tag', to: 'blogs#index', as: :tag
  post "users/:id/subscribe_to_blog" => "users#subscribe_to_blog", as: "subscribe_to_blog"
  post "comment/:id/approve" => "comments#approve_comment", as: "approve_comment"
  post "comment/:id/unapprove" => "comments#unapprove_comment", as: "unapprove_comment"
  get "blogs/:id/download_pdf", controller: 'blogs', action:'download_pdf', as: 'download_pdf'
  resources :values
  post "value/:id/archive" => "values#archive_value", as: "archive_value"
  post "value/:id/unarchive" => "values#unarchive_value", as: "unarchive_value"


end
