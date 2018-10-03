class User < ApplicationRecord

	has_secure_password


  	has_many :locations

  	validates :username, presence: true, uniqueness: true

  	validates :password, presence: :true
                       #:confirmation => true,
                       #:length => { minimum: 6 },
                       #:unless => :already_has_password?

  




end
