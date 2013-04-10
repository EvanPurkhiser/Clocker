class Entry < ActiveRecord::Base
  attr_accessible :description, :end_time, :start_time
end
