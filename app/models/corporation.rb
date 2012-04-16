class Corporation < ActiveRecord::Base
  require 'eaal'
  has_many :users
  has_many :wardecs
  belongs_to :alliance
  attr_accessible :alliance_id, :members, :name, :corp_id
  

end
