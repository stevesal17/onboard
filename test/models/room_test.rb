require 'test_helper'

describe Room do 
	
	# i want to load in the data from fixtures/rooms.yml
	fixtures :rooms

	it "should get a latitude and longitude" do
		# find the room in my fixtures (test data)
		# that doesn't have the latitude and longitude
		@room = rooms(:to_geocode)

		# force room to geocode
		@room.geocode

		# lets check if its not empty
		@room.latitude.wont_be_nil
		@room.longitude.wont_be_nil 

	end
	
end