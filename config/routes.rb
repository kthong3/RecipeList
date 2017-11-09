Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "recipes#index"

  resources :users, except: :new
  resources :recipes
  resources :pinned_recipes

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  get 'signup' => 'users#new'
end
