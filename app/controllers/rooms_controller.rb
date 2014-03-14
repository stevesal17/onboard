class RoomsController < ApplicationController
	# i want to make sure that we're logged in
	# on the new, create, edit, update and destroy
	# so before each one runs, do something to check
	before_action :make_sure_logged_in, 
	only: [:new, :create, :edit, :update, :destroy]


	def index
		# show a list of all the room
		@rooms = Room.all
	end

	def show
		# individual room page
		# params[:id] is that number at end of url
		@room = Room.find(params[:id])
	end

	def new
		# add a new room form
		# @room = Room.new
		@room = current_user.rooms.new
	end

	def create
		# enter the room into the database
		# @room = Room.new(room_params)
		@room = current_user.rooms.new(room_params)

		if @room.save
			flash[:success] = "Your room has been added"
			redirect_to room_path(@room)
		else
			render "new"
		end

	end

	def edit
		# edit form
		# @room = Room.find(params[:id])
		@room = current_user.rooms.find(params[:id])
	end

	def update
		# actually update the db
		# @room = Room.find(params[:id])
		@room = current_user.rooms.find(params[:id])

		if @room.update(room_params) #see below def room_params - save repeating
			flash[:success] = "Your room has been updated"
			redirect_to room_path(@room)
		else
			render "edit"
		end

	end

	def destroy
		# actually delete from the db
		# @room = Room.find(params[:id])
		@room = current_user.rooms.find(params[:id])

		@room.destroy
		flash[:success] = "Your room has been deleted"
		redirect_to root_path
	end


	def room_params
		# this whitelists our form data
		params.require(:room).permit(:name, :address, :number_of_beds,
			:price_in_pence, :is_available)

	end


end
