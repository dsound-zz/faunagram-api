class Api::V1::AnimalsController < ApplicationController
  before_action :find_animal, only: [:update]

 def index
   @animals = Animal.all
    if @animals
   render json: @animals, status: :ok
    else
    render json: { errors: 'no animals yet'}, status: :unprocessible_entity
    end
 end


 def update
   @animal.update(animal_params)
   if @animal.save
     render json: @animal, status: :accepted
   else
     render json: { errors: @animal.errors.full_messages }, status: :unprocessible_entity
   end
 end

 private

 def animal_params
   params.permit(:title, :content)
 end

 def find_animal
   @animal = Animal.find(params[:id])
 end

end
