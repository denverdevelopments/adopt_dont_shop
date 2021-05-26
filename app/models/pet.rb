class Pet < ApplicationRecord
  validates :name, :breed, presence: true
  validates :age, presence: true, numericality: true
  validates :adoptable, inclusion: [true, false]

  belongs_to :shelter
  has_many :pet_applications, dependent: :delete_all
  has_many :applications, through: :pet_applications


  def shelter_name
    shelter.name
  end

  def self.adoptable
    where(adoptable: true)
  end
end
