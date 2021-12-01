Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :events, only: %i[index show]

  resources :groups, only: %i[index show new create destroy]

  resource :profiles, only: %i[show] do
    collection do
      get :search
    end
  end
  resources :friendships, only: %i[new create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
