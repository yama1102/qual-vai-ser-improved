Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :events, only: %i[index show]

  resources :profile, only: %i[new create destroy]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
