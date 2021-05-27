class PetApplicationsController < ApplicationController

  def create
    # binding.pry
    application = Application.find(params[:application_id])
    # @pets = @application.pets
    # @pet_count = @application.pets.count
    pet_find = Pet.find_by(name: params[:search])
    # Pet.where(params[:search])
    # Pet.all.search(params[:search])
    PetApplication.create!(application: application, pet: pet_find)
    redirect_to "/applications/#{application.id}"
  end
end
