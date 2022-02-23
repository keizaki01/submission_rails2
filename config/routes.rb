Rails.application.routes.draw do
  # get 'users/index'
  # devise_for :users
  devise_for :users, module: "users"
  # devise_scope :user do
  #   get '/users/sign_out' => 'devise/sessions#destroy'
  # end
  get 'reservations/index'
  resources :reservations
  
  get "users/show" => "users#show"
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

