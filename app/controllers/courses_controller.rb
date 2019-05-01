class CoursesControllers < ApplicationController
  def index
    @course = Course.all
  end

  def new
    @course = Course.new
  end

  def show
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirected_to @course
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @course = Course.find(params[:id])
    if @course.update(course_params)
      redirected_to @course
    else
      render 'new'
    end
  end


  private

  def course_params
    params.require(:course).permit(:course_type)
  end
end