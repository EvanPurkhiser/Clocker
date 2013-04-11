class Entry < ActiveRecord::Base

  attr_accessible :description, :end_time, :start_time

  belongs_to :invoice

  # Indicates that the entry is currently pending completion
  scope :pending,  where('end_time is null')

  # Order the entries by the most recent clocked-in times first
  scope :in_order, order('start_time DESC')

end
