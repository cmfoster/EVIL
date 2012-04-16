class CreatePastSystems < ActiveRecord::Migration
  def change
    create_table :past_systems do |t|
      t.string :solar_system
      t.string :ship_type
      t.integer :target_id

      t.timestamps
    end
  end
end
