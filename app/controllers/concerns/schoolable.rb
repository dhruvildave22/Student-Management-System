module Schoolable
  extend ActiveSupport::Concern

  def index
    @school = School.all
  end
end