class ExamsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_exam, only: [:show, :update, :destroy, :edit]

  def index
    @exam = Exam.all
    render json: { exam: @exam }, status: :ok 
  end

  def show
    render json: { exam: @exam }, status: :ok }
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :not_found 
  end

  def create
    @exam = Exam.new(exam_params)
    if @exam.save
      render json: { exam: @exam }, status: :created
    else
      render json: @exam.errors, status: :unprocessable_entity
    end
  end

  def update
    if @exam.update(exam_params)
      { render json: { exam: @exam }, status: :ok
    else
      render json: @exam.errors, status: :unprocessable_entity
    end
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end   

  def edit
    render json: { exam: @exam }, status: :ok 
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :not_found
  end

  def destroy
    @exam.destroy
    render json: { message: 'subject is deleted'}, status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :unprocessable_entity 
  end

  private
  def set_exam
    @exam = Exam.find(params[:id])
  end

  def exam_params
    params.require(:exam).permit(:exam_name, :exam_duration, :subject_id, :student_id)
  end
end