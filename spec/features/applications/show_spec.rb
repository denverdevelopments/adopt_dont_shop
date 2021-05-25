require 'rails_helper'

RSpec.describe 'the application show' do
  before(:each) do
    @application = Application.create!(name: 'Bill Withers', address: '670 S. Perry Street', city: 'Atlanta', state: 'GA', zip_code: '30305', good_home: 'Two others friendly dogs at home.', status: 'In Progress')

    @shelter_1 = Shelter.create!(foster_program: true, name: 'Golden Shelter', rank: 1, city: 'Golden')
    @shelter_2 = Shelter.create!(foster_program: true, name: 'Denver Humane Society', rank: 2, city: 'Denver')

    @pet_1 = @shelter_1.pets.create!(name: 'Bark Fluffalo', breed: 'Poodle', age: 3, adoptable: true)
    @pet_2 = @shelter_1.pets.create!(name: 'Florence Pupperson', breed: 'Black Lab', age: 5, adoptable: true)
    @pet_3 = @shelter_2.pets.create!(name: 'Jeffrey', breed: 'Pyrenees', age: 6, adoptable: false)
    @pet_4 = @shelter_2.pets.create!(name: 'Kaya Girl', breed: 'Blue Heeler', age: 1, adoptable: true)

    PetApplication.create!(application: @application, pet: @pet_1)
    PetApplication.create!(application: @application, pet: @pet_2)
    PetApplication.create!(application: @application, pet: @pet_3)
  end

  it "shows the application and all it's attributes" do
      visit "/applications/#{@application.id}"
    expect(page).to have_content(@application.name)
    expect(page).to have_content(@application.address)
    expect(page).to have_content(@application.city)
    expect(page).to have_content(@application.state)
    expect(page).to have_content(@application.zip_code)
    expect(page).to have_content(@application.good_home)
    expect(page).to have_content(@application.status)
  end

  it "shows all the pets on the application" do
      visit "/applications/#{@application.id}"
    expect(page).to have_link(@pet_1.name)
    expect(page).to have_link(@pet_2.name)
    expect(page).to have_link(@pet_3.name)
    expect(page).to_not have_link(@pet_4.name)
  end

  # it "allows the user to delete a pet" do
  #   shelter = Shelter.create(name: 'Mystery Building', city: 'Irvine CA', foster_program: false, rank: 9)
  #   pet = Pet.create(name: 'Scrappy', age: 1, breed: 'Great Dane', adoptable: true, shelter_id: shelter.id)
  #
  #   visit "/pets/#{pet.id}"
  #
  #   click_on("Delete #{pet.name}")
  #
  #   expect(page).to have_current_path('/pets')
  #   expect(page).to_not have_content(pet.name)
  # end
end
