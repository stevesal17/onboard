class OrdersController < ApplicationController

	# first thing is make sure we'vr logged in
	before_action :make_sure_logged_in

	def new
		# booking form
		# i need to find the room that we're making a booking on
		@room = Room.find(params[:room_id])
		# and as room "has_many :orders"
		@order = @room.orders.new
		# which person is booking the room?
		@order.user = current_user
	end


	def create
		# actually process the booking
		@room = Room.find(params[:room_id])
		@order = @room.orders.new(order_params)
		@order.user = current_user

		if @order.save

			# charge the user who's booked
			# :: means Stripe class in the case
			Stripe::Charge.create(
				amount: @room.price_in_pence, 
				currency: "gbp",
				card: @order.stripe_token, 
				description: "Order number #{@order.id}")
			# the above # puts a varible into a string

			# subscriptions
			# Stripe::Customer.create(
			# 	description: "Order number #{@order.id}",
			# 	card: @order.stripe_token,
			# 	plan: "gold"
			# 	)

			# to send the owner of the room an email
			OrderMailer.new_order(@order).deliver

			flash[:success] = "Your room has been booked"
			redirect_to room_path(@room)
		else
			flash[:error] = "Payment unsuccessful"
			render "new"
		end

	end

	def order_params
		params.require(:order).permit(:stripe_token)
		
	end




end
