class TeachersController < ApplicationController
  def index
    @teacher = Teacher.all
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @school = School.find(params[:school_id])
    @teacher = @school.teacher.create(teacher_params)
    if @teacher.save
      redirect_to @teacher
    else
      render 'new'
    end
  end


  def show
    @teacher = Teacher.find(params[:id])
  end



  def update

    @teacher = Teacher.find(params[:id])
    if @teacher.update(teacher_params)
      redirect_to @teacher
    else
      render 'new'
    end
  end

  def destroy
    @school = School.find(params[:school_id])
    @teacher = @school.teachers.find(params[:id])
    @teacher.destroy

    redirect_to 'new'
  end

  private

  def teacher_params
    params.require(:teacher).permit(:t_name, :father_name, :gender, :date_of_birth, :t_address, :date_of_join, :school_id)
  end
end