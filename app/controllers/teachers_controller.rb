class TeachersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
    @teacher = Teacher.new
    respond_to do |format|
      format.json { render json: { teacher: @teacher }, status: :ok }
    end
  end

  def show
    @teacher = Teacher.find(params[:id])
    respond_to do |format|
      format.json { render json: { teacher: @teacher }, status: :ok }
    end
  end

  def create
    @teacher = Teacher.new(teacher_params)
    respond_to do |format|
      if @teacher.save
        format.html { redirect_to school_path(@teacher.school) }
        format.json { render json: { teacher: @teacher }, status: :created }
      end
    end
  end

  def destroy
  end

  def index
    @teachers = Teacher.all
    render json: @teachers
  end

  def edit
    @teacher = Teacher.find(params[:id])
    respond_to do |format|
      format.json { render json: { teacher: @teacher }, status: :ok }
    end
  end

  def update
  end

  private
  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(:t_name, :father_name, :gender, :date_of_birth, :t_address, :date_of_join, :school_id, :student, :teacherable_id, :teacherable_type)
  end
end