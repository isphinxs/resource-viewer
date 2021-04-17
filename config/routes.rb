Rails.application.routes.draw do
  root "pages#home"

  resources :resources
  resources :organizations
  resources :categories
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
