module Studentable
  extend ActiveSupport::Concern
  
  def find_all_students(subject_name)
    s1 = Subject.find_by_subject_name(params[:subject_name])
    get_teacher = s1.teachers
    get_teacher.each do |t|
      get_student = []
      get_student.push(t.students)
    end
  end
end