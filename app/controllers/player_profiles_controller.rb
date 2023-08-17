class PlayerProfilesController < ApplicationController
  before_action :set_player_profile, only: %i[ show update destroy ]
  before_action :authenticate, only: [:show, :update, :destroy]

  # GET /player_profiles
  def index
    @player_profiles = PlayerProfile.all

    render json: @player_profiles
  end

  # GET /player_profiles/1
  def show
    render json: @player_profile
  end

  # POST /player_profiles
  def create
    @player_profile = PlayerProfile.new(player_profile_params)

    if @player_profile.save

        # Trigger the registration confirmation email
        EmailMailer.registration_confirmation(@player_profile).deliver_now
  
      render json: @player_profile, status: :created
    else
      render json: @player_profile.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /player_profiles/1
  def update
    if @player_profile.update(player_profile_params)
      render json: @player_profile
    else
      render json: @player_profile.errors, status: :unprocessable_entity
    end
  end

  # DELETE /player_profiles/1
  def destroy
    @player_profile.destroy
    render json: { message: "Account deleted successfully" }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player_profile
      @player_profile = PlayerProfile.find_by(id: params[:id])
      if @player_profile.nil?
        render json: { error: "Player profile not found" }, status: :not_found
      end
    end

    # Only allow a list of trusted parameters through.
    def player_profile_params
      params.require(:player_profile).permit(:username, :email, :password, :password_confirmation)
    end
end
