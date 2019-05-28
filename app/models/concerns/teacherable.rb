module Teacherable
  extend ActiveSupport::Concern

  def find_all_teachers(school)
    school.teachers.count
  end
end

  