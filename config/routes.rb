Rails.application.routes.draw do
  root "pages#home"

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  post "/logout", to: "sessions#destroy"

  resources :organizations do
    resources :resources, shallow: true # new, index, create
  end

  resources :resources # delete and fix paths 
  resources :categories
  resources :users, only: [:show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
