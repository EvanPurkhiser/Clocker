class Views::Layouts::Base < ActionView::Mustache

  def title
    "Clocker - Hourly Billing Made Easy"
  end

  def css_asset_path
    stylesheet_path 'screen'
  end

  def js_asset_path
    javascript_path 'application'
  end

  def user
    return false if ! @user

    {
      :name            => @user.email,
      :gravatar_id     => Digest::MD5.hexdigest(@user.email),
    }
  end

end
