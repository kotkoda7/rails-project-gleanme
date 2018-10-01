class User < ApplicationRecord

	#attr_accessible :email, :password, :password_confirmation
  
	has_secure_password
	
	validates_presence_of :password, :on => :create
	validates :username, presence: true, uniqueness: true

	has_many :locations, through: :location_edibles

end
