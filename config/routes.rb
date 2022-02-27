Rails.application.routes.draw do
  get 'roomreservations/index'
  get 'rooms/index'
  # get 'users/index'
  # devise_for :users
  devise_for :users, module: "users"
  # devise_scope :user do
  #   get '/users/sign_out' => 'devise/sessions#destroy'
  # end
  get 'reservations/index'
  resources :reservations
  
  get "users/show" => "users#show"
  get '/mypage' => 'users#mypage'
  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :rooms
  resources :rooms do
    resources :roomreservations
  end
end

