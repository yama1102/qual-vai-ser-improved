Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :events, only: %i[index show]
  resources :groups, only: %i[index show new create]
end
