class ApplicationsController < ApplicationController

  def show
    @application = Application.find(params[:id])
    @pets = @application.pets
    @pet_count = @application.pets.count
  end

  def index
    @applications = Application.all
  #   if params[:search].present?
  #     @applications = Application.search(params[:search])
  #   else
  #     @applications = Application.adoptable
  #   end
  end

  def new

  end

  def create
    application = Application.new(application_params)
    if application.save
      redirect_to "/applications/#{application.id}"
    else
      flash[:alert] = "ERROR: #{error_message(application.errors)}"
      render :new
    end
  end

  #
  # def edit
  #   @application = Application.find(params[:id])
  # end
  #
  # def update
  #   application = Application.find(params[:id])
  #   if application.update(application_params)
  #     redirect_to "/applications/#{application.id}"
  #   else
  #     redirect_to "/applications/#{application.id}/edit"
  #     flash[:alert] = "Error: #{error_message(application.errors)}"
  #   end
  # end
  #
  # def destroy
  #   Pet.find(params[:id]).destroy
  #   redirect_to '/applications'
  # end

  private

  def application_params
    params.permit(:id, :name, :address, :city, :state, :zip_code, :good_home, :status)
  end
end
