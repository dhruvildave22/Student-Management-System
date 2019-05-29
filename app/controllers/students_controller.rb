class StudentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_student, only: [:show, :update, :edit, :destroy]

  def index
    @student = Student.all
    respond_to do |format|
      format.json { render json: { student: @student }, status: :ok }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: { student: @student }, status: :ok }
    end
  rescue ActiveRecord::RecordNotFound => e
    respond_to do |format|
      format.json { render json: { error: e.message }, status: :not_found }
    end
  end

  def update
    respond_to do |format|
      if @student.update(student_params)
        format.json { render json: { student: @student }, status: :ok }
      else
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  rescue StandardError => e
    respond_to do |format|
      format.json { render json: { error: e.message }, status: :unprocessable_entity }
    end
  end

  def edit
    respond_to do |format|
      format.json { render json: { student: @student }, status: :ok }
    end
  rescue ActiveRecord::RecordNotFound => e
    respond_to do |format|
      format.json { render json: { error: e.message }, status: :not_found }
    end
  end

  def destroy
    respond_to do |format|
      @student.destroy
      format.json { render json: {}, status: :ok }
    end
  rescue ActiveRecord::RecordNotFound => e
    respond_to do |format|
      format.json { render json: { error: e.message }, status: :unprocessable_entity }
    end
  end

  private
  def set_student
    @student = @school.students.find(params[:id])
  end
  
  def student_params
    params.require(:student).permit(:std_name, :std_father_name, :std_gender, :std_date_of_birth, :std_address, :std_date_of_join, :school_id ,:exam_id)
  end
end