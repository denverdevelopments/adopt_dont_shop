# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Pet.destroy_all
Shelter.destroy_all
Application.destroy_all
PetApplication.destroy_all

withers = Application.create!(name: 'Bill Withers', address: '670 S. Perry Street', city: 'Atlanta', state: 'GA', zip_code: 30305, good_home: 'Two others friendly dogs at home.', status: 'In Progress')
james = Application.create!(name: 'Etta James', address: '1425 Jay Way', city: 'Minneapolis', state: 'MN', zip_code: 55401, good_home: 'Big yard, works from home.', status: 'In Progress')
fitz = Application.create!(name: 'Ella Fitz', address: '5401 E. Warren Ave. #211', city: 'Austin', state: 'TX', zip_code: 78704, good_home: 'Close to parks, owner likes to run.', status: 'In Progress')

aurora = Shelter.create!(foster_program: false, name: 'Aurora Animal Center', rank: 3, city: 'Aurora')
golden = Shelter.create!(foster_program: true, name: 'Golden Shelter', rank: 1, city: 'Golden')
denver = Shelter.create!(foster_program: true, name: 'Denver Humane Society', rank: 2, city: 'Denver')

fluffalo = aurora.pets.create!(name: 'Bark Fluffalo', breed: 'Poodle', age: 3, adoptable: true)
florence = aurora.pets.create!(name: 'Florence Pupperson', breed: 'Black Lab', age: 5, adoptable: true)
jeff = golden.pets.create!(name: 'Jeffrey', breed: 'Pyrenees', age: 6, adoptable: false)
kaya = golden.pets.create!(name: 'Kaya Girl', breed: 'Blue Heeler', age: 1, adoptable: true)
spot = denver.pets.create!(name: 'Spot Marks', breed: 'Dalmation', age: 3, adoptable: false)
buddy = denver.pets.create!(name: 'Buddy Good Boy', breed: 'Bulldog', age: 2, adoptable: true)
barey = denver.pets.create!(adoptable: true, age: 7, breed: 'sphynx', name: 'Bare-y Manilow')
babe = aurora.pets.create!(adoptable: true, age: 3, breed: 'domestic pig', name: 'Babe')
elle = golden.pets.create!(adoptable: true, age: 4, breed: 'chihuahua', name: 'Elle')


PetApplication.create!(application: james, pet: fluffalo)
PetApplication.create!(application: james, pet: kaya)
PetApplication.create!(application: withers, pet: florence)
PetApplication.create!(application: withers, pet: jeff)
kaya.applications << withers
jeff.applications << fitz

# PetApplication.create!(application: fitz, pet: jeff
# PetApplication.create!(application: withers, pet: kaya)
