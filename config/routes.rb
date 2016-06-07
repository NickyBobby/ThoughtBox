Rails.application.routes.draw do
  root to: "links#index"

  resource :user, only: [:new, :create]
  resources :links, only: [:new, :create, :update, :edit]

  get    "/login",  to: "sessions#new"
  post   "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :links, only: [:index, :update, :create]
    end
  end
end
