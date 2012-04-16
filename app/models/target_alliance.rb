class TargetAlliance < ActiveRecord::Base
  belongs_to :wardec
  has_many :target_corporations
  validates_presence_of :wardec_id
  attr_accessible :corporation_count, :name, :wardec_id
end
