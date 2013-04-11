class Views::Dashboard::Entries::List < Views::Layouts::Dashboard

  page_title "Project Entries"

  def project
    @project.attributes
  end

  def current_time
    Time.now.strftime "%A, %B #{Time.now.day.ordinalize} %Y at %l:%M %p"
  end

  def entries
    @entries.map do |e|
      {
        :start_time =>
        {
          :short => e.start_time.strftime('%e/%m/%y %l:%M %p'),
          :full  => e.start_time.utc,
        },
        :end_time =>
        {
          :short => e.end_time.strftime('%e/%m/%y %l:%M %p'),
          :full  => e.end_time.utc,
        },
        :total_hours => "%02d:%02d" % [e.hours, e.minutes.round],
        :money_made  => number_to_currency(e.hours * 25),
        :description => e.description,
      }
    end
  end

  def pending_entry
    return false if @pending.nil?

    day = @pending.start_time.strftime('%A')

    {
      :seconds      => @pending.total_seconds.round,
      :time_clocked => @pending.humainzed_time,
      :since =>
      {
        :time => @pending.start_time.strftime('%l:%m %p'),
        :day  => ['Today', 'Yesterday'].fetch((@pending.hours / 24).floor, day),
      },
    }
  end

end
