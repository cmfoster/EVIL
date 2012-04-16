class Alliance < ActiveRecord::Base
  has_many :corporations
  has_many :wardecs
  attr_accessible :corporation_count, :name
end
