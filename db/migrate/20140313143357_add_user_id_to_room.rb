class AddUserIdToRoom < ActiveRecord::Migration
  def change
# oops already added this in to the room model thats why rake db:migrate failed
  	# add_column :room, :user_id, :integer
  end
end
