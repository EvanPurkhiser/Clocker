class Views::Account::Register < Views::Layouts::Base

  page_title "Signup for Clocker", :no

  delegate :attributes, to: :@new_user, allow_nil: true

  def errors
    puts @new_user.errors.full_messages

    Hash[@new_user.errors.messages.map { |k, v| [k, v.first] }]
  end

end
