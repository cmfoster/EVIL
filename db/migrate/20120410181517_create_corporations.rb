class CreateCorporations < ActiveRecord::Migration
  def change
    create_table :corporations do |t|
      t.string :name
      t.integer :members
      t.integer :alliance_id

      t.timestamps
    end
  end
end
