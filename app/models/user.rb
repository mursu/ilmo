class User < ActiveRecord::Base
  has_many :registrations, :dependent => :destroy

  validates_uniqueness_of :username
  validates_length_of :username, :in => 3..24
  validates_presence_of :real_name
  validates_numericality_of :student_number
  attr_accessor :plain_password
  validates_confirmation_of :plain_password
  validates_length_of :plain_password, :in => 5..32

  def self.authenticate(username, plain_password)
    user = self.find_by_username(username)
    if user
      expected_password = encrypted_password(plain_password, user.salt)
      if user.password != expected_password
        user = nil
      end
    end
    user
  end

  
  def plain_password
    @plain_password
  end

  def plain_password=(pwd)
    @plain_password = pwd
    return if pwd.blank?
    create_new_salt
    self.password = User.encrypted_password(self.plain_password, self.salt)
  end
  
  private
  
  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end
  
  def self.encrypted_password(plain_password, salt)
    string_to_hash = plain_password + "wibble" + salt
    Digest::SHA1.hexdigest(string_to_hash)
  end
end
