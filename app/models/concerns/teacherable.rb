module Teacherable
  extend ActiveSupport::Concern

  # included do
  #   has_many :teachers, as: :teacherable
  # end

  def find_all_teachers(school)
    school.teachers.count
    # self.teacher = @school.teachers.all
  end
end

  