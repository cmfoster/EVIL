class User < ActiveRecord::Base
  require 'eaal'
  belongs_to :corporation
  attr_accessible :alliance_id, :alliance_name, :char_id, :char_name, :corp_id, :corp_name, :corporation_id, :ship_type
  
  
  #IMPORTANT, DROP WARTARGET/USER RELATIONSHIP, CREATE CORPORATION & ALLIANCE TABLES. USERS BELONG TO CORPORATION, CORPORATION BELONGS
  #TO ALLIANCE, WARTARGETS WILL BELONG TO CORPORATION. ALL CHECKS FOR A USERS WARTARGET WILL BE DONE BY CHECKING TO SEE IF USER IS IN AN 
  #ALLIANCE THEN CORPORATION, IF CORPORATION THEN CHECK CORP TARGETS, IF ALLIANCE THEN CHECK ALLIANCE TARGETS
  
  
  def self.user_check(user_hsh, session)
    if session[:last_seen].nil? || session[:last_seen] < 30.minutes.ago
      charid = user_hsh['HTTP_EVE_CHARID']
      charname = user_hsh['HTTP_EVE_CHARNAME']
      corpname = user_hsh['HTTP_EVE_CORPNAME'] || "none"
      corpid = user_hsh['HTTP_EVE_CORPID'] || 0
      alliancename = user_hsh['HTTP_EVE_ALLIANCENAME'] || "none"
      allianceid = user_hsh['HTTP_EVE_ALLIANCEID'] || 0
      shiptype = user_hsh['HTTP_EVE_SHIPTYPENAME'] || "none"
      user = find_or_create_by_char_id_and_char_name(charid, charname)
      user.update_attributes(
      :corp_name => corpname, :corp_id => corpid, :alliance_name => alliancename, 
      :alliance_id => allianceid, :ship_type => shiptype
      )
    end
  end
  
  def self.get_ceo_id_unregistered_corp(corp_id)
    EAAL.cache = EAAL::Cache::FileCache.new("eaalcache")
    api = EAAL::API.new("31337","31337FAKE", "corp")
    if corp_id
      begin
        info = api.corporationsheet(:corporationid => corp_id)
        return {:ceoid => info.ceoID, :ceoname => info.ceoName}
      rescue EAAL::Exception.EveAPIException(523) #WORKS FOR NOW
        return nil
      end
    end
  end
  
  def check_distance(user_location, target_location)
    begin
      xml = Nokogiri::HTML(open("http://evemaps.dotlan.net/route#{user_location}:#{target_location}"))
      jumps = xml.xpath("//table[@class='tablelist table-tooltip']/tr").last.children.first.text
    rescue exception
      return "Unknown"
    end
  end
end
