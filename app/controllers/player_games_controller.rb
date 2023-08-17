class PlayerGamesController < ApplicationController
    before_action :set_player_profile
    before_action :set_player_game, only: [:show, :update, :destroy]
  
    # GET /player_profiles/:player_profile_id/player_games
    def player_games_by_profile
      @player_games = @player_profile.player_games
      render json: @player_games, only: [:id, :game_posting_id, :player_profile_id]
    end
  
    # Other actions (show, update, destroy) here
  
    private
  
    def set_player_profile
      @player_profile = PlayerProfile.find_by(id: params[:player_profile_id])
      if @player_profile.nil?
        render json: { error: "Player profile not found" }, status: :not_found
      end
    end
  
    def set_player_game
      @player_game = @player_profile.player_games.find_by(id: params[:id])
      if @player_game.nil?
        render json: { error: "Player game not found" }, status: :not_found
      end
    end
  
    # Other private methods for strong parameters here
  end
  