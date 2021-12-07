Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :events, only: %i[index show] do
    collection do
      get :search
    end
    member do
      post 'favorites', to: "events#toggle_favorite"
    end

  end
  resources :groups, only: %i[index show new create destroy] do
    collection do
      patch ':id/close', to: "groups#close", as: "close_group"
    end
    resources :grouped_events, only: %i[index new create destroy] do
      collection do
        get 'votes'
        post 'votes', to: "grouped_events#add_vote"
        delete 'votes', to: "grouped_events#cancel_vote"
        get 'result', to: "grouped_events#result"
      end
    end
    resources :messages, only: :create
  end

  resource :profiles, only: %i[show]
  resources :friendships, only: %i[new create] do
    collection do
      get :search
    end
  end
end
