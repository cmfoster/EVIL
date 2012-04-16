class CreateWardecs < ActiveRecord::Migration
  def change
    create_table :wardecs do |t|
      t.string :decname
      t.text :notes
      t.datetime :end_date
      t.integer :alliance_id
      t.integer :corporation_id

      t.timestamps
    end
  end
end
