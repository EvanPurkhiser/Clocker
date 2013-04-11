class Entry < ActiveRecord::Base

  attr_accessible :description, :end_time, :start_time

  belongs_to :invoice

  # Find pending or completed entries
  scope :pending,  where('end_time is null')
  scope :complete, where('end_time is not null')

  # Find entires that are part of the current invoice cycle
  scope :uninvoiced, where('invoice_id is null')

  # Order the entries by the most recent clocked-in times first
  scope :in_order, order('start_time DESC')

  # Check if this entry is currently pending completion
  def pending?
    return end_time.nil?
  end

end
