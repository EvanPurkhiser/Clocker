class Views::Account::Register < Views::Layouts::Base

  page_title "Signup for Clocker", :no

  delegate :attributes, to: :@new_user, allow_nil: true

  def errors
    Hash[@new_user.errors.messages.map { |k, v| [k, v.first] }] if @new_user
  end

end
