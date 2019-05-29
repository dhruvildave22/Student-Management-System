class ApplicationController < ActionController::Base
  include Response
  def present(object, klass = nil)
    klass ||= "#{object.class}Presenter".constantize
    klass.new(object, view_context)
  end
  protect_from_forgery with: :exception
end
