class StudentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    student = Student.all
    render json: { student: student }, status: :ok
  end

  def show
    student = Student.find(params[:id])
    render json: { student: student }, status: :ok 
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :not_found
  end

  def update
    student = Student.find(params[:id])
    if student.update(student_params)
      render json: { student: student }, status: :ok
    else
      render json: student.errors, status: :unprocessable_entity
    end
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def create
    student = Student.new(student_params)
    if student.save
      render json: { student: student }, status: :created 
    else
      render json: student.errors, status: :unprocessable_entity 
    end
  end

  def edit
    student = Student.find(params[:id])
  end

  def destroy
    student = Student.find(params[:id])
    student.destroy
    render json: { message: 'student is deleted'}, status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  private
  def student_params
    params.require(:student).permit(:std_name, :std_father_name, :std_gender, :std_date_of_birth, :std_address, :std_date_of_join, :school_id ,:exam_id)
  end
end