Rails.application.routes.draw do
  root to: "homes#show"

  resource :user, only: [:new, :create]

  get    "/login",  to: "sessions#new"
  post   "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
