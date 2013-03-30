class Views::Layouts::Base < ActionView::Mustache

  @@title = "Hourly Billing Made Easy"

  def title
    "Clocker / " + @@title
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
      :name        => @user.email,
      :gravatar_id => Digest::MD5.hexdigest(@user.email),
    }
  end

  def alerts
    @alerts.map do |alert|
      { :type => alert.keys[0].to_s, :message => I18n.t(alert.values[0]) }
    end
  end

end
