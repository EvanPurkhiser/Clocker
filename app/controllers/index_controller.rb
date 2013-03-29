class IndexController < ActionController::Base

  layout 'layouts/base'

  def index
    render template: 'index'
  end

end
