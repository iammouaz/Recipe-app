Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :recipes
  resources :foods
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "foods#index"
  delete '/foods/:id', to: 'food#destroy', as: "delete_food"
  get '/public_recipes', to: 'recipes#public_recipes', as: "public_recipes"
end
