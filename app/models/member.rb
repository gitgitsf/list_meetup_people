class Member < ActiveRecord::Base    
  belongs_to  :job_title        
  has_many :comments  do
    def all_public_and_login_user_comments(current_user)   
      find :all, :conditions => [ 'user_id = ? OR share = ?', current_user, 'Public']
    end
    
  end
                 
  
  has_many :users, :through => :comments, :uniq => true   
  
  validates_presence_of :job_title     
  validates_presence_of :first,  :message => "can't be blank", :case_senitive => false 
  validates_presence_of :last, :message => "can't be blank", :case_senitive => false        
  validates_presence_of :gender, :message => "can't be blank" 
   
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,  :message => "is invalid", :if => :email?
  validates_uniqueness_of :first, :scope => :last, :message => "already existed"
       


end
