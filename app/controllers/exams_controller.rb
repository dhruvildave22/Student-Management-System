class ExamsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    exam = Exam.all
    render json: { exam: exam }, status: :ok 
  end

  def show
    exam = Exam.find(params[:id])
    render json: { exam: exam }, status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :not_found
  end

  def create
    exam = Exam.new(exam_params)
    if exam.save
      render json: { exam: exam }, status: :created
    else
      render json: exam.errors, status: :unprocessable_entity
    end
  end

  def update
    exam = Exam.find(params[:id])
    if exam.update(exam_params)
      render json: { exam: exam }, status: :ok
    else
      render json: exam.errors, status: :unprocessable_entity
    end
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def destroy
    exam = Exam.find(params[:id])
    exam.destroy
    render json: { message: 'exam is deleted'}, status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :unprocessable_entity 
  end

  private
  def exam_params
    params.require(:exam).permit(:exam_name, :exam_duration, :subject_id, :student_id)
  end
end