class ApplicationController < ActionController::Base
  include Response
  protect_from_forgery with: :exception

  def present(object, klass = nil)
    klass ||= "#{object.class}Presenter".constantize
    klass.new(object, view_context)
  end
end
