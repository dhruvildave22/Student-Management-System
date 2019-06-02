class PartialsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def update_school_and_teacher_code
    school = School.find(params[:id])
    if school.school_code != params[:school_code]
      School.transaction do 
        school.update_attributes!(:school_code => params[:school_code])        
        teacher = Teacher.find(params[:teacher_id])
        teacher.update_attributes!(:teacher_code => school.school_code)
        student = Student.find(params[:student_id])
        student.update_attributes!(:student_code => school.school_code) 
        render json: { message: ' data update_school_and_teacher_code '}
      end
    else
      render json: { message: ' data not updated '}
    end
    rescue => e
      render json: { error: ' data not found '}
  end
end