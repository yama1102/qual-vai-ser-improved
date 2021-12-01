Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :events, only: %i[index show]
  resources :groups, only: %i[index show new create destroy] do
    resources :grouped_events, only: %i[index new create destroy]
  end

  resource :profiles, only: %i[show] do
    collection do
      get :search
    end
  end
  resources :friendships, only: %i[new create]
end
