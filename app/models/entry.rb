class Entry < ActiveRecord::Base

  # Indicates that the entry is currently pending completion
  scope :pending, where(:end_time => nil)

  attr_accessible :description, :end_time, :start_time
end
