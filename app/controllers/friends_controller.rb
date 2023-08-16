class FriendsController < ApplicationController
  before_action :set_player_profile
  before_action :set_friend, only: %i[show update destroy]

  # GET /player_profiles/:player_profile_id/friends
  def index
    @friends = @player_profile.friends
    render json: @friends, only: [:id, :invite_status, :player_profile_id]
  end

  # GET /player_profiles/:player_profile_id/friends/:id
  def show
    render json: @friend, only: [:id, :invite_status, :player_profile_id]
  end

  # POST /player_profiles/:player_profile_id/friends
  def create
    @friend = @player_profile.friends.build(friend_params)

    if @friend.save
      render json: @friend, status: :created, location: @friend
    else
      render json: @friend.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /player_profiles/:player_profile_id/friends/:id
  def update
    if @friend.update(friend_params)
      render json: @friend
    else
      render json: @friend.errors, status: :unprocessable_entity
    end
  end

  # DELETE /player_profiles/:player_profile_id/friends/:id
  def destroy
    @friend.destroy
  end

  private

  def set_player_profile
    @player_profile = PlayerProfile.find_by(id: params[:player_profile_id])
    if @player_profile.nil?
      render json: { error: "Player profile not found" }, status: :not_found
    end
  end

  def set_friend
    @friend = @player_profile.friends.find_by(id: params[:id])
    if @friend.nil?
      render json: { error: "Friend not found" }, status: :not_found
    end
  end

  def friend_params
    params.require(:friend).permit(:username, :invite_status)
  end
end
