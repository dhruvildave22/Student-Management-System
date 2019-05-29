class CoursesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_course, only: [:show, :update, :destroy, :edit]

  def index
    @course = Course.all
    respond_to do |format|
      format.json { render json: { course: @course }, status: :ok }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: { course: @course }, status: :ok }
    end
  rescue ActiveRecord::RecordNotFound => e
    respond_to do |format|
      format.json { render json: { error: e.message }, status: :not_found }
    end
  end

  def create
    @course = Course.new(course_params)
    respond_to do |format|
      if @course.save
        format.json { render json: { course: @course }, status: :created }
      else
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @course.update(course_params)
        format.json { render json: { course: @course }, status: :ok }
      else
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  rescue StandardError => e
    respond_to do |format|
      format.json { render json: { error: e.message }, status: :unprocessable_entity }
    end
  end  

  def edit
    respond_to do |format|
      format.json { render json: { course: @course }, status: :ok }
    end
  rescue ActiveRecord::RecordNotFound => e
    respond_to do |format|
      format.json { render json: { error: e.message }, status: :not_found }
    end
  end

  def destroy
    respond_to do |format|
      @course.destroy
      format.json { render json: {}, status: :ok }
    end
  rescue ActiveRecord::RecordNotFound => e
    respond_to do |format|
      format.json { render json: { error: e.message }, status: :unprocessable_entity }
    end
  end
  private
  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:course_type, :school_id)
  end
end