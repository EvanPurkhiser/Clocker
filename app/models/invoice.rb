class Invoice < ActiveRecord::Base

  attr_accessible :project_id

  has_many :entries, dependent: :destroy

end
