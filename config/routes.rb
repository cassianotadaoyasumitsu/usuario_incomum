Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { confirmations: 'confirmations' }

  devise_scope :user do
    authenticated :user do
      root 'pages#home', as: :authenticated_root
      resources :users do
        resources :posts, only: [:new, :create]
      end
    end

    unauthenticated do
      root 'pages#home', as: :unauthenticated_root
      resources :posts, only: [:index]
    end
  end
  resources :posts, only: [:show, :edit, :update, :destroy, :index]
end
