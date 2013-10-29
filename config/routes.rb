SeatSeller::Application.routes.draw do
  devise_for :users

  devise_scope :user do 
    get 'sign_up' => 'devise/registrations#new'
    delete 'sign_out' => 'devise/sessions#destroy'
    get 'sign_in' => 'devise/sessions#new'
  end

  resources :fares, only: :update
  resources :trips do 
    resources :fares, only: :create
  end



  root to: 'trips#index'
end
