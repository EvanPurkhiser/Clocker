class Views::Dashboard::Entries::List < Views::Layouts::Dashboard

  page_title "Project Entries"

  delegate :clocked_in?, to: :@project

  def project
    @project.attributes
  end

  def entries
    @entries.map do |e|
      {
        :start_time =>
        {
          :short => e.start_time.strftime("%e/%m/%y %l:%M %p"),
          :full  => e.start_time.utc,
        },
        :end_time =>
        {
          :short => e.end_time.strftime("%e/%m/%y %l:%M %p"),
          :full  => e.end_time.utc,
        },
        :total_hours => "%02d:%02d" % [e.hours, e.minutes.round],
        :money_made  => number_to_currency(e.hours * 25),
      }
    end
  end

end
