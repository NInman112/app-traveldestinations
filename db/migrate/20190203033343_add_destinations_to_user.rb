class AddDestinationsToUser < ActiveRecord::Migration
  def change
    create_table :user_dests do |t|
      t.integer :user_id
      t.integer :dest_id
    end
  end
end
