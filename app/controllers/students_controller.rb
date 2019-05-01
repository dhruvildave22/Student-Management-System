class StudentsController < ApplicationController
  def index
    @student = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @school = School.find(params[:school_id])
    @student = @school.students.create(student_params)
    if @student.save
      redirect_to @student
    else
      render 'new'
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to @student
    else
      render 'new'
    end
  end

  def destroy
    @school = School.find(params[:school_id])
    @student = @school.students.find(params[:id])
    @student.destroy

    redirect_to 'new'
  end

  private

  def student_params
    params.require(:student).permit(:std_name, :std_father_name, :std_gender, :std_date_of_birth, :std_address, :std_date_of_join, :school_id)
  end
end