Rails.application.routes.draw do
  devise_for :teams
  root to: "teams#index"
  resources :teams, only: [:index, :show, :edit, :update] do
    resources :members
    resources :games, only: [:index, :new, :create]
    resources :rooms, only: [:index, :create, :destroy] do
      resources :messages, only: [:index, :create, :destroy]
    end
  end
end
