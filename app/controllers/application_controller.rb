class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :igb_detect
  
  
  private
  
  def igb_detect
    if request.user_agent
      request.format = :igb if request.user_agent.downcase.include? "eve-igb" unless request.format == :js
    end
    return true
  end
end
