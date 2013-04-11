class Views::Dashboard::Entries::List < Views::Layouts::Dashboard

  page_title "Project Entries"

  delegate :clocked_in?, to: :@project

  def project
    @project.attributes
  end

  def entries
    @entries.map &:attributes
  end

  def current_time
    Time.now.strftime "%l:%M %p on %A %B #{Time.now.day.ordinalize}, %Y"
  end





end
