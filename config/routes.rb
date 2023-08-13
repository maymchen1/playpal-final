Rails.application.routes.draw do
  resources :descriptions
  resources :game_postings
  resources :friends
  resources :player_profiles
end
