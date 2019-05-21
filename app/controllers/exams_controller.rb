class ExamsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_exam, only: [:show, :update, :destroy]

  def index
     @exams = Exam.all
    render json: { exams: @exams }, status: :ok 
  end

  def show
    json_response(@exam)
  end


  def create
    Exam.create(exam_params)
    json_response(@subject, :created)
  end

  def update
    if @exam.update(exam_params)
      json_response(@exam, :updated)
    else
      json_response(@exam, :unprocessable_entity)
    end
  end    

  def destroy
    @exam.destroy
  end

  private

  def set_exam
    @exam = Exam.find(params[:id])
  end

  def exam_params
    params.require(:exam).permit(:exam_name, :exam_duration, :subject_id, :student_id)
  end

end