class CreateAlliances < ActiveRecord::Migration
  def change
    create_table :alliances do |t|
      t.string :name
      t.integer :corporation_count

      t.timestamps
    end
  end
end
