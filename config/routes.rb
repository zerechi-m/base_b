Rails.application.routes.draw do
  devise_for :teams
  root to: "teams#index"
  resources :teams, only: [:index, :show, :edit, :update] do
    resources :members
    resources :rooms, only: [:index, :create] do
      resources :messages, only: [:index]
    end
  end
end
