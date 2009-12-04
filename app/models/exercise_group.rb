class ExerciseGroup < ActiveRecord::Base
  belongs_to :course_instance
  has_many :users, :through => :registrations
  has_many :registrations, :dependent => :destroy
end
