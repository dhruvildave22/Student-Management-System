class CoursesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    course = Course.all
    render json: { course: course }, status: :ok 
  end

  def show
    course = Course.find(params[:id])
    render json: { course: course }, status: :ok 
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :not_found 
  end

  def create
    course = Course.new(course_params)
    if course.save
      render json: { course: course }, status: :created 
    else
      render json: course.errors, status: :unprocessable_entity
    end
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity 
  end

  def update
    course = Course.find(params[:id])
    if course.update(course_params)
      render json: { course: course }, status: :ok
    else
      render json: course.errors, status: :unprocessable_entity 
    end
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity 
  end

  def destroy
    course = Course.find(params[:id])
    course.destroy
    render json: { message: 'subject is deleted'}, status: :ok
  rescue ActiveRecord::InvalidForeignKey => e
    render json: { error: 'foreignKeyViolation course can not be deleted'}, status: :internal_server_error
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :unprocessable_entity 
  end

  private
  def course_params
    params.require(:course).permit(:course_type, :school_id)
  end
end