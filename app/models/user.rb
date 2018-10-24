class User < ApplicationRecord

	has_secure_password

	#accepts_nested_attributes_for :locations, allow_destroy: true
    has_many :locations
    has_many :edibles, through: :edible_locations
    has_many :edible_locations
    
	  has_many :locations
  	has_many :locations, through: :edible_locations
  	accepts_nested_attributes_for :edible_locations


  	validates :username, presence: true, uniqueness: true

  	validates :password, presence: :true
                       #:confirmation => true,
                       #:length => { minimum: 6 },
                       #:unless => :already_has_password?

  




end
