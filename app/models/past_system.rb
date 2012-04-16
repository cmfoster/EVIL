class PastSystem < ActiveRecord::Base
  belongs_to :target
  validates_presence_of :target_id
  attr_accessible :ship_type, :solar_system, :target_id
end
