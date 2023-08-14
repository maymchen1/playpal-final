Rails.application.routes.draw do
  get "/home", to: "home#index"
  resources :descriptions
  resources :game_postings
  resources :friends
  resources :player_profiles
end
