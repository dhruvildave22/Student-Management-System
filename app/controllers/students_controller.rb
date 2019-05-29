class StudentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_student, only: [:show, :update, :edit, :destroy]

  def index
    @student = Student.all
    render json: { student: @student }, status: :ok
  end

  def show
    render json: { student: @student }, status: :ok 
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :not_found
  end

  def update
    if @student.update(student_params)
      render json: { student: @student }, status: :ok
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def edit
    render json: { student: @student }, status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :not_found
  end

  def destroy
    @student.destroy
    render json: { message: 'student is deleted'}, status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  private
  def set_student
    @student = @school.students.find(params[:id])
  end
  
  def student_params
    params.require(:student).permit(:std_name, :std_father_name, :std_gender, :std_date_of_birth, :std_address, :std_date_of_join, :school_id ,:exam_id)
  end
end