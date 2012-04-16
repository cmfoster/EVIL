class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :char_id
      t.string :char_name
      t.string :corp_name
      t.integer :corp_id
      t.string :alliance_name
      t.integer :alliance_id
      t.string :ship_type
      t.integer :corporation_id

      t.timestamps
    end
  end
end
