Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:index]
      resources :keeps, only: [:index, :create, :destroy]
      resources :shares, only: [:index, :create, :destroy]
    end
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { confirmations: 'confirmations' }

  devise_scope :user do
    authenticated :user do
      root 'pages#home', as: :authenticated_root
      resources :users do
        resources :posts, only: [:new, :create]
        get "posted", to: "posts#user_posted"
        resources :keeps, only: [:index, :destroy]
      end
    end

    unauthenticated do
      root 'pages#home', as: :unauthenticated_root
      resources :posts, only: [:index]
    end
  end
  resources :posts, only: [:show, :edit, :update, :destroy, :index]
end
