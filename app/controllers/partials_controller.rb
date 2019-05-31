class PartialsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def update_school_and_teacher_code
    school = School.find_by_id(params[:id])
    if school.school_code == params[:school_code]
      School.transaction do 
        school.update_attributes!(:school_code => params[:school_code])        
        teacher = Teacher.first
        teacher.update_attributes!(:teacher_code => params[:teacher_code]) 
        student = Student.first
        student.update_attributes!(:student_code => params[:student_code])  
      end
    end
  rescue => e
    p e
  end
end




