class CoursesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_course, only: [:show, :update, :destroy, :edit]

  def index
    @course = Course.all
    render json: { course: @course }, status: :ok 
  end

  def show
    render json: { course: @course }, status: :ok 
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :not_found 
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      render json: { course: @course }, status: :created 
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  def update
    if @course.update(course_params)
      render json: { course: @course }, status: :ok
    else
      render json: @course.errors, status: :unprocessable_entity 
    end
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity 
  end  

  def edit
    render json: { course: @course }, status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :not_found
  end

  def destroy
    @course.destroy
    render json: { message: 'subject is deleted'}, status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :unprocessable_entity 
  end

  private
  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:course_type, :school_id)
  end
end