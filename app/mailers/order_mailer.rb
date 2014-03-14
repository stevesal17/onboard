class OrderMailer < ActionMailer::Base
  default from: "stevesalhany@yahoo.co.uk"

  
  # could call it anything such as welcome
  # the (order) bit is us sending through the order to the emails
  def new_order(order)
  	# lets make the order available inthe view
  	@order = order
  	@room = @order.room
  	@user = @room.user

  	mail to: @user.email, subject: "You have a new order"
  end



end
