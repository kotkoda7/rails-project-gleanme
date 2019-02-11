class User < ApplicationRecord

	has_secure_password

    has_many :locations
    #has_many :edibles, through: :locations
    accepts_nested_attributes_for :locations

  	validates :username, presence: true, uniqueness: true

  	validates :password, presence: :true
                       #:confirmation => true,
                       #:length => { minimum: 6 },
                       #:unless => :already_has_password?

  
	def self.find_or_create_from_auth_hash(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
			user.provider = auth.provider
			user.uid = auth.uid
			user.email = auth.info.email
			user.image = auth.info.image
			user.save!
		end
	end

end
