Rails.application.routes.draw do
  resources :home
  resources :descriptions
  resources :game_postings
  resources :friends
  resources :player_profiles
  post '/login', to: 'sessions#create'
  get '/player_profiles/:player_profile_id/game_postings', to: 'game_postings#game_postings_by_profile'
  get '/player_profiles/:player_profile_id/player_games', to: 'player_games#player_games_by_profile'
  get '/player_profiles/:player_profile_id/friends', to: 'friends#index'
  get '/register', to: 'registrations#new'
  post '/register', to: 'registrations#create'
end

