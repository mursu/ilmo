class Course < ActiveRecord::Base
  has_many :course_instances, :dependent => :destroy
  
  validates_presence_of :name, :description
  validates_uniqueness_of :name
end
