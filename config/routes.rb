Rails.application.routes.draw do
  get 'notifications/index'

  root 'top#index'
  resources :topics do
    resources :comments
  end
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :users, only: [:index, :show]
  resources :relationships, only: [:create, :destroy]
  resources :conversations do
    resources :messages
  end
  if Rails.env.development?
   mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
