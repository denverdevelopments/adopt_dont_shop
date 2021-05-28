class Admin::SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
    # @shelters = Shelter.order_by_reverse_alphabetical
    @pets = Pet.all
  end
end
