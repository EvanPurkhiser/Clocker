class Views::Dashboard::Projects::List < Views::Layouts::Dashboard

  page_title "Your Projects"

  def projects
    @projects.map &:attributes
  end

end
