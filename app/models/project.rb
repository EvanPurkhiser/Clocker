class Project < ActiveRecord::Base

  has_many :entries, dependent: :destroy

  attr_accessible :name, :user_id

  validates :name, presence: true
end
