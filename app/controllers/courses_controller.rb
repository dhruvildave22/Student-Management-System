class CoursesControllers < ApplicationController
    skip_before_action :verify_authenticity_token

  before_action :set_school
  before_action :set_course, only: [:show, :update, :destroy]


  def index
    json_response(@school.course)
  end

   # GET /school/:school_id/teachers/:id

  def show
    json_response(@course)
  end

  #GET /school/:school_id/teachers/:id
  def new
    @course = Course.new
  end

  def create
    @school.teacher.create(teacher_params)
    json_response(@school, :created)
  end

  def update
    if @course.update(course_params)
      json_response(@course, :updated)
    else
      json_response(@course, :unprocessable_entity)
    end
  end    

  def destroy
    @course.destroy
  end

  private
   def set_school
    @school = School.find(params[:school_id])
  end

  def set_course
    @course = Course.find(params[:id])
  end


  def course_params
    params.require(:course).permit(:course_type, :school_id)
  end
end