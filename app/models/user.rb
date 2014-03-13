class User < ActiveRecord::Base

	# releationships
	has_many :rooms


	# validations
	validates :name, presence: true
	validates :email, presence: true, uniqueness: true
	validates :username, presence: true, uniqueness: true

	# gems
	has_secure_password



end
