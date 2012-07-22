class UsersController < ApplicationController
  respond_to :js, :html
  before_filter :user_check, :only => :index
  
  def index
    @user = User.find_by_char_id(request.env["HTTP_EVE_CHARID"])
      #@wartarget = @user.wartargets.build #WILL HAVE TO CHANGE
  end
  
  def reload
    @user = User.find_by_char_id(request.env['HTTP_EVE_CHARID'])
    respond_with @user
  end
  
  def create_or_update_target
    
  end
  
  private
  
  def user_check
    unless User.find_by_char_id(request.env["HTTP_EVE_CHARID"])
      redirect_to :controller => 'home', :action => 'index'
    end
  
    #  request.format = :igb #USED TO SIMULATE REQUEST FROM IRB WHEN USING OUT OF GAME BROWSERS
    # if request.format == :igb # && request.env['HTTP_EVE_TRUSTED'].downcase == 'yes'
    #   User.user_check(request.env, session)
    #   reset_session
    #   session[:last_seen] = Time.now
    # end
  end
end
