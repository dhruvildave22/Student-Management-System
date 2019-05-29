class ExamsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_exam, only: [:show, :update, :destroy, :edit]

  def index
    @exam = Exam.all
    respond_to do |format|
      format.json { render json: { exam: @exam }, status: :ok }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: { exam: @exam }, status: :ok }
    end
  rescue ActiveRecord::RecordNotFound => e
    respond_to do |format|
      format.json { render json: { error: e.message }, status: :not_found }
    end
  end

  def create
    @exam = Exam.new(exam_params)
    respond_to do |format|
      if @exam.save
        format.json { render json: { exam: @exam }, status: :created }
      else
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @exam.update(exam_params)
        format.json { render json: { exam: @exam }, status: :ok }
      else
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  rescue StandardError => e
    respond_to do |format|
      format.json { render json: { error: e.message }, status: :unprocessable_entity }
    end
  end   

  def edit
    respond_to do |format|
      format.json { render json: { exam: @exam }, status: :ok }
    end
  rescue ActiveRecord::RecordNotFound => e
    respond_to do |format|
      format.json { render json: { error: e.message }, status: :not_found }
    end
  end

  def destroy
    respond_to do |format|
      @exam.destroy
      format.json { render json: {}, status: :ok }
    end
  rescue ActiveRecord::RecordNotFound => e
    respond_to do |format|
      format.json { render json: { error: e.message }, status: :unprocessable_entity }
    end
  end

  private
  def set_exam
    @exam = Exam.find(params[:id])
  end

  def exam_params
    params.require(:exam).permit(:exam_name, :exam_duration, :subject_id, :student_id)
  end
end