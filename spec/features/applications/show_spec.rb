require 'rails_helper'

RSpec.describe 'the application show' do
  before(:each) do
    @application_1 = Application.create!(name: 'Bill Withers', address: '670 S. Perry Street', city: 'Atlanta', state: 'GA', zip_code: '30305', good_home: 'Two others friendly dogs at home.', status: 'In Progress')
    @application_2 = Application.create!(name: 'Etta James', address: '1425 Jay Way', city: 'Minneapolis', state: 'MN', zip_code: 55401, good_home: 'Big yard, works from home.', status: 'Submitted')


    @shelter_1 = Shelter.create!(foster_program: true, name: 'Golden Shelter', rank: 1, city: 'Golden')
    @shelter_2 = Shelter.create!(foster_program: true, name: 'Denver Humane Society', rank: 2, city: 'Denver')

    @pet_1 = @shelter_1.pets.create!(name: 'Bark Fluffalo', breed: 'Poodle', age: 3, adoptable: true)
    @pet_2 = @shelter_1.pets.create!(name: 'Florence Pupperson', breed: 'Black Lab', age: 5, adoptable: true)
    @pet_3 = @shelter_2.pets.create!(name: 'Jeffrey', breed: 'Pyrenees', age: 6, adoptable: false)
    @pet_4 = @shelter_2.pets.create!(name: 'Kaya Girl', breed: 'Blue Heeler', age: 1, adoptable: true)

    PetApplication.create!(application: @application_1, pet: @pet_1)
    PetApplication.create!(application: @application_1, pet: @pet_2)
    PetApplication.create!(application: @application_1, pet: @pet_3)
    PetApplication.create!(application: @application_2, pet: @pet_4)
  end

  describe 'when I visit a non-submitted applications show page' do
    it "shows the application and all it's attributes" do
        visit "/applications/#{@application_1.id}"
      expect(page).to have_content(@application_1.name)
      expect(page).to have_content(@application_1.address)
      expect(page).to have_content(@application_1.city)
      expect(page).to have_content(@application_1.state)
      expect(page).to have_content(@application_1.zip_code)
      expect(page).to have_content(@application_1.status)
      # expect(page).to have_content(@application_1.good_home)
    end

    it "shows all the pets on the application" do
        visit "/applications/#{@application_1.id}"
      expect(page).to have_link(@pet_1.name)
      expect(page).to have_link(@pet_2.name)
      expect(page).to have_link(@pet_3.name)
      expect(page).to_not have_link(@pet_4.name)
    end

    it 'has a text box to filter results by name' do
      visit "/applications/#{@application_1.id}"
      expect(page).to have_content("Add a Pet to this Application")
      # expect(find('form')).to have_button('Search Pets by Name')
      expect(page).to have_button("Search Pets by Name")
    end

    it 'has a submit button if one or more pet is added' do
        visit "/applications/#{@application_1.id}"
      expect(page).to have_button("Submit Application")
    end
  end

  describe 'when I visit a submitted applications show page' do
    it "shows the application and all it's attributes" do
        visit "/applications/#{@application_2.id}"
      expect(page).to have_content(@application_2.name)
      expect(page).to have_content(@application_2.address)
      expect(page).to have_content(@application_2.city)
      expect(page).to have_content(@application_2.state)
      expect(page).to have_content(@application_2.zip_code)
      expect(page).to have_content(@application_2.status)
      # expect(page).to have_content(@application_2.good_home)
    end

    it "shows all the pets on the application" do
        visit "/applications/#{@application_2.id}"
      expect(page).to have_link(@pet_4.name)
      expect(page).to_not have_link(@pet_1.name)
    end

    it 'has no text search box or submit button' do
      visit "/applications/#{@application_2.id}"
      expect(page).to_not have_content("Add a Pet to this Application")
      expect(page).to have_button("Search Pets by Name")
      expect(page).to_not have_button("Submit Application")
    end
  end

end


  # it 'lists partial matches as search results' do
  #   shelter = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
  #   pet_1 = Pet.create(adoptable: true, age: 7, breed: 'sphynx', name: 'Bare-y Manilow', shelter_id: shelter.id)
  #   pet_2 = Pet.create(adoptable: true, age: 3, breed: 'domestic pig', name: 'Babe', shelter_id: shelter.id)
  #   pet_3 = Pet.create(adoptable: true, age: 4, breed: 'chihuahua', name: 'Elle', shelter_id: shelter.id)
  #
  #   visit "/pets"
  #
  #   fill_in 'Search', with: "Ba"
  #   click_on("Search")
  #
  #   expect(page).to have_content(pet_1.name)
  #   expect(page).to have_content(pet_2.name)
  #   expect(page).to_not have_content(pet_3.name)
  # end

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
