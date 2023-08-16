Rails.application.routes.draw do
  resources :home
  resources :descriptions
  resources :game_postings
  resources :friends
  resources :player_profiles
  post '/login', to: 'sessions#create'
end
