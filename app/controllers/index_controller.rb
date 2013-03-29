class IndexController < ApplicationController

  layout 'layouts/base'

  def index
    render template: 'index'
  end

end
