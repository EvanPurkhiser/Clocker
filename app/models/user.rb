class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :password

  validates_presence_of :email
  validates_uniqueness_of :email

  # Authenticate a user by a passed email and password.
  #
  # Returns: self, or false if authentication fails
  def self.authenticate(email, password)
    find_by_email(email).try(:authenticate, password)
  end

end
