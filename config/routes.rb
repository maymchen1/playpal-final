Rails.application.routes.draw do
  resources :descriptions
  resources :game_postings
  resources :friends
  resources :player_profiles
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
