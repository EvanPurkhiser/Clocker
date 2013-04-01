class Views::Layouts::Base < ActionView::Mustache

  class_attribute :title

  # Set the page title.
  #
  # It's possible to have the application name added to the title on either side
  # of the passed page title by passing the options :left, :right, or :none. You
  # can also set the delmiter for the title
  #
  # Returns String
  def self.page_title(title, with_name = :left, delimiter = '-')
    title = [Clocker::NAME, title].join(" #{delimiter} ") if with_name == :left
    title = [title, Clocker::NAME].join(" #{delimiter} ") if with_name == :right

    self.title = title
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
