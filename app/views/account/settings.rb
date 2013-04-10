class Views::Account::Settings < Views::Layouts::Base

  page_title "Account Settings"

  def errors
    Hash[@user.errors.messages.map { |k, v| [k, v.first] }] if @user
  end

end
