# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base  
  require 'digest/sha1'
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details  
  helper_method :authenticate
 
  include AuthenticatedSystem    

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password        
  
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
     # username == "admin" && password == "bar"
      username == "admin" && (Digest::SHA1.hexdigest(password) == "0583168ad74a1282d2dfe7caacd5859466cdf722")
    end  
  end
  
end
