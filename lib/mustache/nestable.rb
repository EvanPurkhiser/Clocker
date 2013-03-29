# By mixing in this module into a mustache view model the template will then
# have the ability to be nested within other templates. This is done by using
# the mustache tag at the end of a template
#
#     {{parent!/path/to/parent}}
#
# This will nest the current template under a new template where the `{{yield}}`
# tag is specified in the parent template
module Mustache::Nestable

  # Call the parent_layout render method if a parent_tag is passed
  def method_missing(method, *args, &block)
    return super unless path = parent_tag(method)
    parent_layout template: path
  end

  # Check if we can respond to a parent_tag call
  def respond_to?(method)
    !!parent_tag(method) || super
  end

  protected

  # Extracts the template path for a nested template by looking for a name that
  # matches the syntax
  #
  #     parent!/layout/base
  #
  # Where anything after the 'parent!' is considered the path to the template
  #
  # Returns The template path or nil
  def parent_tag(name)
    name.to_s.scan(/^parent!(.*)$/).flatten.first
  end

  # This is a special method that will take the current output buffer and place
  # it in the yielding section template
  def parent_layout(options)
    @_view.view_flow.set :layout, @_view.output_buffer
    @_view.output_buffer = @_view.render options
    nil
  end
end
