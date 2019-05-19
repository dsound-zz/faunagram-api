class Api::V1::SightingsController < ApplicationController
  before_action :find_sighting, only: [:update, :show, :destroy]

  def index

   @sightings = Sighting.all
      render json: @sightings, status: :accepted
  end


  def show
    render json: @sighting, status: :ok
  end


  def create
    @sighting = Sighting.new(sighting_params)
      if @sighting.save
        render json: @sighting, status: :accepted
      else
        render json: { errors: @sighting.errors.full_messages }, status: :unprocessible_entity
      end
  end


  def update
   @sighting.update(sighting_params)
    if @sighting.save
      render json: @sighting, status: :accepted
    else
     render json: { errors: @sighting.errors.full_messages }, status: :unprocessible_entity
    end
  end


  def destroy
    if curr_user.id == @sighting.user_id
      @sighting.delete
      render json: "sighting deleted"
    else
      render json: { errors: "You are not authorized to delete"}
    end
  end


  private

  def sighting_params
   params.permit(:title, :body, :likes, :image, :user_id, :animal_id)
  end

  def find_sighting
   @sighting = Sighting.find(params[:id])
  end


end
