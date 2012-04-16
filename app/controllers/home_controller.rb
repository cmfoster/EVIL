class HomeController < ApplicationController
  # before_filter :simulate_format, :only => [:index]
  
  def index    
    if request.format == :igb && !request.env["HTTP_EVE_TRUSTED"].blank?
      if request.env["HTTP_EVE_TRUSTED"].downcase == "yes"
        corp_id = request.env["HTTP_EVE_CORPID"]
        redirect_to :controller => 'users', :action => 'index' if User.find_by_char_id(request.env["HTTP_EVE_CHARID"])
        @corporation = Corporation.find_by_corp_id(corp_id) if corp_id
        @users_ceo = User.get_ceo_id_unregistered_corp(corp_id) unless @corporation
      end
    end
  end

 def simulate_format
   request.format = :igb
 end
    
end
