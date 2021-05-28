class Admin::ApplicationsController < ApplicationController
  def index
    @applications = Application.all
  end

  def show
    @application = Application.find(params[:id])
    @pets = @application.pets
    @pet_count = @application.count_pets
  end

  def update
    if params[:form] == "approve"
      application = Application.find(params[:id])
      application.status = "Approved"
      application.save
    elsif params[:form] == "reject"
      application = Application.find(params[:id])
      application.status = "Rejected"
      application.save
    end
    redirect_to "/admin/applications/#{application.id}"
  end
end
