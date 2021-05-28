require 'rails_helper'

RSpec.describe Application, type: :model do
  describe 'relationships' do
    it { should have_many(:pet_applications) }
    it { should have_many(:pets).through(:pet_applications) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:zip_code) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:good_home) }

  end

  before(:each) do
    @application_1 = Application.create!(name: 'Bill Withers', address: '670 S. Perry Street', city: 'Atlanta', state: 'GA', zip_code: '30305', good_home: 'Two others friendly dogs at home.', status: 'In Progress')

    @shelter_1 = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
    @pet_1 = @shelter_1.pets.create(name: 'Mr. Pirate', breed: 'tuxedo shorthair', age: 5, adoptable: true)
    @pet_2 = @shelter_1.pets.create(name: 'Clawdia', breed: 'shorthair', age: 3, adoptable: true)
    @pet_3 = @shelter_1.pets.create(name: 'Ann', breed: 'ragdoll', age: 3, adoptable: false)

    PetApplication.create!(application: @application_1, pet: @pet_1)
    @application_1.pets << @pet_2
    @pet_3.applications << @application_1
  end

  describe 'instance methods' do
    describe '.count_pets' do
      it 'returns the shelter name for the given pet' do
        expect(@application_1.count_pets).to eq(3)
      end
    end
  end
end

  # describe 'class methods' do
  #   describe '#search' do
  #     it 'returns partial matches' do
  #       expect(Pet.search("Claw")).to eq([@pet_2])
  #     end
  #   end
  # end
