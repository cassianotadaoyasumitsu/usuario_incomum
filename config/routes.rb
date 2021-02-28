Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: 'confirmations' }

devise_scope :user do
  authenticated :user do
    root 'pages#home', as: :authenticated_root
  end

  unauthenticated do
    root 'devise/sessions#new', as: :unauthenticated_root
  end
end
end
