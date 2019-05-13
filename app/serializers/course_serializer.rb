class CourseSerializer < ApplicationSerializer
  attributes :id, :course_type
  has_many :students
end