class ApplicationsController < ApplicationController

  def show
    @application = Application.find(params[:id])
    @pets = @application.pets
    @pet_count = @application.count_pets
    if params[:search]
      # @pet_searched = Pet.where(name: params[:search])
      @pet_searched = Pet.search(params[:search])
    end
  end

  def index
    @applications = Application.all
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

  private

  def application_params
    params.permit(:id, :name, :address, :city, :state, :zip_code, :good_home, :status, :search)
  end
end
