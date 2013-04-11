class Views::Dashboard::Entries::List < Views::Layouts::Dashboard

  page_title "Project Entries"

  delegate :clocked_in?, to: :@project

  def project
    @project.attributes
  end

  def entries
    @entries.map do |e|
      exact_seconds   = (e.end_time - e.start_time)
      exact_hours     = exact_seconds / 1.hour
      partial_minutes = ((exact_seconds % 1.hour) / 1.minute).round

      {
        :start_time  =>
        {
          :short => e.start_time.strftime("%e/%m/%y %l:%M %p"),
          :full  => e.start_time.utc
        },
        :end_time  =>
        {
          :short => e.end_time.strftime("%e/%m/%y %l:%M %p"),
          :full  => e.end_time.utc
        },
        :total_hours => "%02d:%02d" % [exact_hours, partial_minutes],
        :money_made  => number_to_currency(exact_hours * 25)
      }
    end
  end

end
