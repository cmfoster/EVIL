class CreateTargets < ActiveRecord::Migration
  def change
    create_table :targets do |t|
      t.string :name
      t.string :ship_type
      t.text :notes
      t.integer :target_corporation_id

      t.timestamps
    end
  end
end
