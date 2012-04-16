class CreateTargetAlliances < ActiveRecord::Migration
  def change
    create_table :target_alliances do |t|
      t.string :name
      t.integer :corporation_count
      t.integer :wardec_id

      t.timestamps
    end
  end
end
