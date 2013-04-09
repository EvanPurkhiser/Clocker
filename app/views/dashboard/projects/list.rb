class Views::Dashboard::Projects::List < Views::Layouts::Dashboard

  def projects
    @projects.map &:attributes
  end

end
