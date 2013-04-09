class Profile < ActiveRecord::Base

  belongs_to :user

  attr_accessible :company, :name, :user_id

end
