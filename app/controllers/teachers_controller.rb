class TeachersController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :set_school
  before_action :set_teacher, only: [:show, :update, :destroy]

  #GET /school/:school_id/teachers

  def index
    json_response(@school.teachers)
  end

   # GET /school/:school_id/teachers/:id

  def show
    json_response(@teacher)
  end

  #GET /school/:school_id/teachers/:id
  def new
    @school = School.find(params[:school_id])
    @teacher = Teacher.new
  end

  def create
    @school.teachers.create(teacher_params)
    json_response(@school, :created)
  end

  def update
    if @teacher.update(teacher_params)
      json_response(@teacher, :updated)
    else
      json_response(@teacher, :unprocessable_entity)
    end
  end    

  def destroy
    @teacher.destroy
  end

  private
   def set_school
    @school = School.find(params[:school_id])
  end

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(:t_name, :father_name, :gender, :date_of_birth, :t_address, :date_of_join, :school_id)
  end
end