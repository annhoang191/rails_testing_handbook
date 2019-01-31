Rails.application.routes.draw do
  resources :books
  resources :homes
  devise_for :users
  root to: "books#index"
end
