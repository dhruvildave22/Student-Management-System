class CoursesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_course, only: [:show, :update, :destroy]

  def index
    @courses = Course.all
    render json: { courses: @courses }, status: :ok 
  end

   # GET /school/:school_id/teachers/:id

  def show
    respond_to do |format|
      format.json { render json: @course, status: :ok }
    end
  end

  #GET /school/:school_id/teachers/:id
  def new
    @course = Course.new
  end

  def create
    @course = Course.create(course_params)
    respond_to do |format|
      if @course.save
        format.json { render json: @course, status: :created }
      end
    end
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

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:course_type, :school_id)
  end
end