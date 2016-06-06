Rails.application.routes.draw do
  root to: "links#index"

  resource :user, only: [:new, :create]
  resource :links, only: [:new, :create]

  get    "/login",  to: "sessions#new"
  post   "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
