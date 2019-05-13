class ExamsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_subject
  before_action :set_exam, only: [:show, :update, :destroy]



  def index
    json_response(@subject.exams), each_serializer: SubjectSerializer
  end


  def show
    json_response(@exam)
  end

  # def new
  #   @subject = Subject.new
  # end

  def create
    @subject.exams.create(exam_params)
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

  def set_subject
    @subject = Subject.find(params[:subject_id])
  end

  def set_exam
    @exam = Exam.find(params[:id])
  end

  def exam_params
    params.require(:exam).permit(:exam_name, :exam_duration, :subject_id)
  end

end