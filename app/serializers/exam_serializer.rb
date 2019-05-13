class ExamSerializer < ApplicationSerializer
  attributes :id, :exam_name
  has_many :students
end