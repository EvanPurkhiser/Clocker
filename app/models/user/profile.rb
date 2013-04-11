class User::Profile < ActiveRecord::Base

  attr_accessible :company, :name, :user_id

  belongs_to :user

end
