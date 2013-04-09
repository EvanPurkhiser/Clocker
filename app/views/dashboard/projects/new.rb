class Views::Dashboard::Projects::New < Views::Layouts::Dashboard

  delegate :attributes, to: :@project, allow_nil: true

  def errors
    Hash[@project.errors.messages.map { |k, v| [k, v.first] }] if @project
  end

end
