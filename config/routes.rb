Rails.application.routes.draw do
  devise_for :teams
  root to: "teams#index"
  resources :teams, only: [:index, :show, :edit, :update] do
    resources :members
    resources :games, only: [:index, :create, :destroy] do
      resources :orders, only: [:new, :create, :show, :destroy]
      resources :batting_results, only: [:index, :create]
    end
    resources :rooms, only: [:index, :create, :destroy] do
      resources :messages, only: [:index, :create, :destroy]
    end
  end
  resources :games, only: [:index] do
    resources :results, only: [:index, :create, :update, :show]
  end
end
