module Studentable
  extend ActiveSupport::Concern

  def find_all_students(school)
    school.student.all
  end
end