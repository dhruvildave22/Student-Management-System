class PartialsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def update_school_and_teacher_code
    school = School.friendly.find_by_id(params[:id])
    previous_school = School.previous
    if school.school_code == previous_school(params[:school_code])
      School.transaction do 
        school.update_attributes!(:school_code => params[:school_code])        
        teacher = Teacher.find_by_id(params[:teacher_id])
        teacher.update_attributes!(:teacher_code => params[:teacher_code])
        student = Student.find_by_id(params[:student_id])
        student.update_attributes!(:student_code => params[:student_code])
      rescue ActiveRecord::RecordNotFound => e
        render json: { error: e.message }, status: :unprocessable_entity  
      end
    end
  end
end



