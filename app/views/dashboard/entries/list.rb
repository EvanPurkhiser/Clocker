class Views::Dashboard::Entries::List < Views::Layouts::Dashboard

  page_title "Project Entries"

  delegate :clocked_in?, to: :@project

  def project
    @project.attributes
  end

  def entries
    @entries.map do |e|
      hours = (e.end_time - e.start_time) / 3600

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
        :total_hours => hours.round(2),
        :money_made  => number_to_currency(hours * 25)
      }
    end
  end

end
