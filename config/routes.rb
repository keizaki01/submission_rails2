Rails.application.routes.draw do
  get 'roomreservations/index'
  get 'rooms/index'

  devise_for :users, module: "users"
  
  get 'reservations/index'
  resources :reservations
  get "users/show" => "users#show"
  get '/mypage' => 'users#mypage'
  resources :users, only: [:show, :edit, :update]
  
  resources :rooms do
    collection do
     get 'search' => 'rooms#search'
     get 'tokyo' => 'rooms#tokyo'
     get 'osaka' => 'rooms#osaka'
     get 'kyoto' => 'rooms#kyoto'
     get 'sapporo' => 'rooms#sapporo'
     get 'top' => 'rooms#top'
    end  

    resources :roomreservations, :except => :show
    collection do
     post ":room_id/roomreservations/confirm", to:"roomreservations#confirm"
     patch ":room_id/roomreservations/:id/editconfirm", to:"roomreservations#editconfirm"
    end
  end
end

