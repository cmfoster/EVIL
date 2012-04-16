class Target < ActiveRecord::Base
  belongs_to :target_corporation
  has_many :past_systems
  validates_presence_of :target_corporation_id
  attr_accessible :name, :notes, :ship_type, :target_corporation_id
end
