class SessionsController < ApplicationController
    def create
      player_profile = PlayerProfile.find_by(username: params[:session][:username])
  
      if player_profile && player_profile.authenticate(params[:session][:password])
        render json: { success: true, userData:player_profile }
      else
        render json: { success: false, error: "Invalid username or password"}
      end
    end
  end
  