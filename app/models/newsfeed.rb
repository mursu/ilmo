class Newsfeed < ActiveRecord::Base
  
  default_scope :order => 'created_at DESC'
  
  def self.user_registered(user)
    create :message => "User #{user.username} registered!"
  end
  
end
