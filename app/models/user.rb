class User < ActiveRecord::Base
  validates_uniqueness_of :username
  validates_length_of :username, :in => 3..24
  validates_presence_of :real_name
  validates_numericality_of :student_number
  validates_confirmation_of :password
  validates_length_of :password, :in => 5..32
end
