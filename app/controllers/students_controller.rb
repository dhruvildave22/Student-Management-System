class StudentsController < ApplicationController
  
  skip_before_action :verify_authenticity_token
  before_action :set_school
  # before_action :set_student, only: [:show, :destroy]

  #GET /school/:school_id/students

  def index
    json_response(@school.students)
  end

   # GET /school/:school_id/students/:id

  def show
    @student = @school.students.find(params[:id])
    respond_to do |format|
      format.json { render json: @student, status: :found}
    end
  end

  #GET /school/:school_id/students/:id
  def new
    @student = Student.new
  end

  def create
    @student = @school.students.create(student_params)
    respond_to do |format|
      if @student.save
        format.json { render json: @student, status: :created }
      else
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @student.update(student_params)
        format.json { render json: @student, status: :created }
      else
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end    

  def destroy
    @student.destroy
  end

  private
  def set_school
    @school = School.find(params[:school_id])
  end
  def set_student
    @student = @school.students.find(params[:id])
  end
  def student_params
    params.require(:student).permit(:std_name, :std_father_name, :std_gender, :std_date_of_birth, :std_address, :std_date_of_join, :school_id)
  end
end