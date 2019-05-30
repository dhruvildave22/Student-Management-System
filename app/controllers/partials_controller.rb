class PartialsController < ApplicationController

  def update_school_and_teacher_code
    School.transaction do 
       school = School.find_by_id(8)
       if school.school_code == 1
         school.update_attributes!(:school_code => 3)
         teacher = Teacher.update(:teacher_code => 2)
         student = Student.update(:student_code => 2)
       else
        raise ActiveRecord::Rollback
      end
    end
  end
end



    





