Rails.application.routes.draw do
  devise_for :teams
  root to: "teams#index"
end
