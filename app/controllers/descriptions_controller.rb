class DescriptionsController < ApplicationController
  before_action :set_description, only: %i[ show update destroy ]

  # GET /descriptions
  def index
    @descriptions = Description.all

    render json: @descriptions, only: [:id, :genre, :player_limit, :description_text,:description_title, :game_posting_id]
  end

  # GET /descriptions/1
  def show
    render json: @description, only: [:id, :genre, :player_limit, :description_text,:description_title, :game_posting_id]
  end

  # POST /descriptions
  def create
    @description = Description.new(description_params)

    if @description.save
      render json: @description, status: :created, location: @description
    else
      render json: @description.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /descriptions/1
  def update
    if @description.update(description_params)
      render json: @description
    else
      render json: @description.errors, status: :unprocessable_entity
    end
  end

  # DELETE /descriptions/1
  def destroy
    @description.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_description
      @description = Description.find(params[:id])
      if @description.nil?
        render json: { error: "Description not found" }, status: :not_found
      end
    end

    # Only allow a list of trusted parameters through.
    def description_params
      params.require(:description).permit(:genre, :player_limit, :description_text, :description_title)
    end
end
