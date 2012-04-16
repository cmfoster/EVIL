class Wardec < ActiveRecord::Base
  has_many :target_alliances
  has_many :target_corporations
  attr_accessible :alliance_id, :corporation_id, :end_date, :notes, :decname
end
