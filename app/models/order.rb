class Order < ActiveRecord::Base

	# releationships
	belongs_to :room
	belongs_to :user
	


end
