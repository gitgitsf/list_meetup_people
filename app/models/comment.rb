class Comment < ActiveRecord::Base      
  
  belongs_to :member
  belongs_to :user
                     
  validates_presence_of :content,  :message => "can't be blank"
 
end
