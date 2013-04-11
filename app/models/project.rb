class Project < ActiveRecord::Base

  has_many :entries, dependent: :destroy

  attr_accessible :name, :user_id

  validates :name, presence: true

  # Check if the user is currently clocked in for this project.
  #
  # This will return true if there is atleast one entry for this project that
  # doesn't have a end_time set on it
  def clocked_in?
    return entries.pending.count > 0
  end

  # Clock in as long as we aren't currently clocked in
  def clock_in
    raise InvalidProjectState if clocked_in?

    entries << Entry.new(:start_time => Time.now)
    self
  end

  # Clock out as long as we are currently clocked in
  def clock_out(attributes = {})
    raise InvalidProjectState unless clocked_in?

    attributes = attributes.merge :end_time => Time.now
    entries.pending.first.update_attributes(attributes)
    self
  end

  # An invalid project state exception means that we tried to clock in when we
  # were already clocked in, or clock out when we were already clocked out
  class InvalidProjectState < Exception; end

end
