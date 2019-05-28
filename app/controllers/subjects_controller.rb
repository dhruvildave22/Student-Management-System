class SubjectsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_subject, only: [:show, :update, :destroy]

  def index
    @subjects = Subject.all
    render json: { subjects: @subjects }, status: :ok 
  end

  def show
    json_response(@subject)
  end

  def create
    @teacher.subjects.create(subject_params)
    json_response(@teacher, :created)
  end

  def update
    if @subject.update(subject_params)
      json_response(@subject, :updated)
    else
      json_response(@subject, :unprocessable_entity)
    end
  end

  def destroy
    @subject.destroy
  end

  private
  def set_teacher
    @teacher = Teacher.find(params[:teacher_id])
  end

  def set_subject
    @subject = Subject.find(params[:id])
  end

  def subject_params
    params.require(:subject).permit(:subject_name, :teacher_id)
  end
end