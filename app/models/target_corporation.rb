class TargetCorporation < ActiveRecord::Base
  belongs_to :target_alliance
  belongs_to :wardec
  has_many :targets
  validate :presence_of_wardec_id_or_target_alliance_id
  attr_accessible :members, :name, :target_alliance_id, :wardec_id
  
  def presence_of_wardec_id_or_target_alliance_id
    id = wardec_id || target_alliance_id
    errors.add("No wardec_id or target_alliance_id, There must be a parent model") if id.blank?
  end
end
