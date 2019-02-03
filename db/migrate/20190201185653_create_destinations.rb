class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :dest_name
      t.string :dest_description
      t.integer :user_id
    end
  end
end
