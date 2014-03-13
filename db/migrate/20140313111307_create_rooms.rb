class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|


    	t.string :name
    	t.text :address
    	t.integer :number_of_beds
    	t.integer :price_in_pence
    	t.boolean :is_available
    	t.float :latitude
    	t.float :longitude
    	t.integer :user_id
    	# computers are not great with float math so thats why we are using price in pence

      t.timestamps
    end
  end
end
