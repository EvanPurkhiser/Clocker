class Views::Account::Register < Views::Layouts::Base

  page_title "Signup for Clocker", :no

  delegate :attributes, to: :@new_user, allow_nil: true
  delegate :errors,     to: :@new_user, allow_nil: true

end
