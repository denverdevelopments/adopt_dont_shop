class ApplicationsController < ApplicationController

  def show
    @application = Application.find(params[:id])
    @pets = @application.pets
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
      flash[:errors] = application.errors.full_messages.to_sentence
      # flash[:notice] = "Application not created: Incomplete"
      # flash[:alert] = "Error: #{error_message(pet.errors)}"

      render :new
    end
  end

    # if application.save
    #   redirect_to "/shelters/#{application_params[:shelter_id]}/applications"
    # else
    #   redirect_to "/shelters/#{application_params[:shelter_id]}/applications/new"
    #   flash[:alert] = "Error: #{error_message(application.errors)}"
    # end
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
