class CreateTargetCorporations < ActiveRecord::Migration
  def change
    create_table :target_corporations do |t|
      t.string :name
      t.string :members
      t.integer :target_alliance_id
      t.integer :wardec_id

      t.timestamps
    end
  end
end
