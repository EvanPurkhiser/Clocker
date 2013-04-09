class Project < ActiveRecord::Base
  attr_accessible :name, :user_id

  validates :name, presence: true
end
