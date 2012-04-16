class AddCorpIdToCorporations < ActiveRecord::Migration
  def change
    add_column :corporations, :corp_id, :integer
  end
end
