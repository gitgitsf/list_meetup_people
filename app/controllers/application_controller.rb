# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base  
  require 'digest/sha1'
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details  
  helper_method :authenticated?    
  helper_method :authenticate 
  helper_method :count_member_comments
 
  include AuthenticatedSystem    

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password        
                                         
  def authenticated?
    if !logged_in?
      flash[:notice] = "You must login to do that"
      redirect_to :back
      #redirect_to root_path
      #redirect_to members_path   #mt add: show user all topics after login
      false
    end 
  end
  
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
     # username == "admin" && password == "bar"
      username == "admin" && (Digest::SHA1.hexdigest(password) == "0583168ad74a1282d2dfe7caacd5859466cdf722")
    end  
  end
        
        
  def count_member_comments(member) 
    tot_comments = @member.comments.size
    tot_private_comments = @member.comments.find_all_by_share("Private").size  
    return    tot_comments,   tot_private_comments
  end
end
