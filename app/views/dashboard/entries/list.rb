class Views::Dashboard::Entries::List < Views::Layouts::Dashboard

  page_title "Project Entries"

  def project
    @project.attributes
  end

  def current_time
    Time.now.strftime "%A, %B #{Time.now.day.ordinalize} %Y at %l:%M %p"
  end

  def pending_entry
    return false if @pending.nil?

    day = @pending.start_time.strftime('%A')

    {
      :seconds      => @pending.total_seconds.round,
      :time_clocked => @pending.humainzed_time,
      :since =>
      {
        :time => @pending.start_time.strftime('%l:%M %p'),
        :day  => ['Today', 'Yesterday'].fetch((@pending.hours / 24).floor, day),
      },
    }
  end

  def entries
    @entries.map do |e|
      {
        :start_time =>
        {
          :short => e.start_time.strftime('%m/%e/%y %I:%M %p'),
          :full  => e.start_time.utc,
        },
        :end_time =>
        {
          :short => e.end_time.strftime('%m/%e/%y %I:%M %p'),
          :full  => e.end_time.utc,
        },
        :total_hours => "%02d:%02d" % [e.hours, e.minutes.round],
        :money_made  => number_to_currency(e.hours * 25),
        :description => e.description,
      }
    end
  end

  def sums
    all_entries = @entries

    # Includ the current pending entry in the list if we're working now
    all_entries.push @pending unless @pending.nil?

    return if all_entries.empty?

    # Get the start and end dates of this current invoice cycle
    start_time = all_entries.first.start_time
    end_time   = all_entries.last.end_time || Time.now

    # Calculat the total number of hours worked
    hours = all_entries.map(&:total_seconds).sum / 1.hour

    {
      :hours => hours.round,
      :money => number_to_currency(hours * 25),
      :start => start_time.strftime("%A %B #{start_time.day.ordinalize}"),
      :end   => end_time.strftime("%A %B #{end_time.day.ordinalize}"),
    }
  end

end
