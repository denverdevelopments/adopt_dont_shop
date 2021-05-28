class Application < ApplicationRecord
  validates :name, :address, :city, :state, :zip_code, presence: true
  validates :status, presence: true, inclusion: ["In Progress", "Pending", "Accepted", "Rejected"]

  has_many :pet_applications, dependent: :delete_all
  has_many :pets, through: :pet_applications

  def count_pets
    pets.count
  end

  # has_many :pets, dependent: :destroy

  # def self.order_by_number_of_pets
  #   select("shelters.*, count(pets.id) AS pets_count")
  #     .joins("LEFT OUTER JOIN pets ON pets.shelter_id = shelters.id")
  #     .group("shelters.id")
  #     .order("pets_count DESC")
  # end

  # def shelter_pets_filtered_by_age(age_filter)
  #   adoptable_pets.where('age >= ?', age_filter)
  # end
end
