class GamePostingsController < ApplicationController
  before_action :set_game_posting, only: %i[ show update destroy ]

  # GET /game_postings
  def index
    @game_postings = GamePosting.all
    render json: @game_postings , only: [:id, :title]
  end

  # GET /game_postings/1
  def show
    render json: @game_posting , only: [:id, :title]
  end

  # POST /game_postings
  def create
    @game_posting = GamePosting.new(game_posting_params)
    if @game_posting.save
      render json: @game_posting, status: :created, location: @game_posting
    else
      render json: @game_posting.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /game_postings/1
  def update
    if @game_posting.update(game_posting_params)
      render json: @game_posting
    else
      render json: @game_posting.errors, status: :unprocessable_entity
    end
  end

  # DELETE /game_postings/1
  def destroy
    @game_posting.destroy
  end

  # GET /player_profiles/:player_profile_id/game_postings
  def game_postings_by_profile
    @player_profile = PlayerProfile.where(id: params[:player_profile_id])
    
    if @player_profile
      @game_postings = @player_profile.game_postings
      render json: @game_postings
    else
      render json: { error: "Player profile not found" }, status: :not_found
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_posting
      @game_posting = GamePosting.find(params[:id])
      if @game_posting.nil?
        render json: { error: "Game posting not found" }, status: :not_found
      end
    end

    # Only allow a list of trusted parameters through.
    def game_posting_params
      params.require(:game_posting).permit(:title)
    end
end
