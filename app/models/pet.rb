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

  # def self.search(search)
  #   self.where("name ILIKE :search", { search: "%#{params[:search]}%"})
  #   # self.where("headline LIKE :query", { query: "%#{params[:query]}%"})
  #   # self.where("headline ILIKE ?", "%#{params[:query]}%")
  #   # self.where('name = ?', search) if search
  # end

end
