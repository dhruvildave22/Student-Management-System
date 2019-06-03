class ExamSerializer < ApplicationSerializer
  attributes :id, :exam_name, :"string,", :exam_duration, :"integer,", :subject_id, :"integer,", :student_id, :integer
end
