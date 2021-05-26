require 'rails_helper'

RSpec.describe 'the pets index' do
  before(:each)do
  end

  it 'has a link to Start an Application' do
      visit "/pets"
    expect(page).to have_link("Start an Application")
    click_link("Start an Application")
    expect(current_path).to eq("/applications/new")
  end

  it 'lists all the pets with their attributes' do
    shelter_1 = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
    shelter_2 = Shelter.create!(foster_program: true, name: 'Golden Shelter', rank: 1, city: 'Golden')

    pet_1 = Pet.create(adoptable: true, age: 1, breed: 'sphynx', name: 'Lucille Bald', shelter_id: shelter_1.id)
    pet_2 = Pet.create(adoptable: false, age: 3, breed: 'doberman', name: 'Lobster', shelter_id: shelter_1.id)
    pet_3 = shelter_2.pets.create!(name: 'Jeffrey', breed: 'Pyrenees', age: 6, adoptable: false)
    pet_4 = shelter_2.pets.create!(name: 'Kaya Girl', breed: 'Blue Heeler', age: 1, adoptable: true)

      visit "/pets"
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.breed)
    expect(page).to have_content(pet_1.age)
    expect(page).to have_content(shelter_1.name)

    expect(page).to have_content(pet_4.name)
    expect(page).to have_content(pet_4.breed)
    expect(page).to have_content(pet_4.age)
    expect(page).to have_content(shelter_2.name)
  end

  # save_and_open_page
  # it 'only lists adoptable pets' do
  #   shelter = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
  #   pet_1 = Pet.create(adoptable: true, age: 1, breed: 'sphynx', name: 'Lucille Bald', shelter_id: shelter.id)
  #   pet_2 = Pet.create(adoptable: true, age: 3, breed: 'doberman', name: 'Lobster', shelter_id: shelter.id)
  #   pet_3 = Pet.create(adoptable: false, age: 2, breed: 'saint bernard', name: 'Beethoven', shelter_id: shelter.id)
  #
  #   visit "/pets"
  #
  #   expect(page).to_not have_content(pet_3.name)
  # end
  #
  # it 'displays a link to edit each pet' do
  #   shelter = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
  #   pet_1 = Pet.create(adoptable: true, age: 1, breed: 'sphynx', name: 'Lucille Bald', shelter_id: shelter.id)
  #   pet_2 = Pet.create(adoptable: true, age: 3, breed: 'doberman', name: 'Lobster', shelter_id: shelter.id)
  #
  #   visit '/pets'
  #
  #   expect(page).to have_content("Edit #{pet_1.name}")
  #   expect(page).to have_content("Edit #{pet_2.name}")
  #
  #   click_link("Edit #{pet_1.name}")
  #
  #   expect(page).to have_current_path("/pets/#{pet_1.id}/edit")
  # end
  #
  # it 'displays a link to delete each pet' do
  #   shelter = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
  #   pet_1 = Pet.create(adoptable: true, age: 1, breed: 'sphynx', name: 'Lucille Bald', shelter_id: shelter.id)
  #   pet_2 = Pet.create(adoptable: true, age: 3, breed: 'doberman', name: 'Lobster', shelter_id: shelter.id)
  #
  #   visit '/pets'
  #
  #   expect(page).to have_content("Delete #{pet_1.name}")
  #   expect(page).to have_content("Delete #{pet_2.name}")
  #
  #   click_link("Delete #{pet_1.name}")
  #
  #   expect(page).to have_current_path("/pets")
  #   expect(page).to_not have_content(pet_1.name)
  # end
end
