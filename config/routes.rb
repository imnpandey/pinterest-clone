Rails.application.routes.draw do
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  match '/users/:id/finish_signup' => 'users#finish_signup',
          via: [:get, :patch], :as => :finish_signup

  root to: "pins#index"
  resources :pins, only: [:index, :new, :create, :show] do
    resources :comments, only: [:show, :create]
  end
end
