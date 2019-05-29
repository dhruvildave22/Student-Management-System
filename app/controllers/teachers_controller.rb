class TeachersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_teacher, only: [:show, :update, :edit, :destroy]  

    def index
    @teacher = Teacher.all
     render json: { teacher: @teacher }, status: :ok
  end

  def show
    render json: { teacher: @teacher }, status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :not_found 
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      render json: { teacher: @teacher }, status: :created 
    else
      render json: @teacher.errors, status: :unprocessable_entity
    end
  end

  def update
    if @teacher.update(teacher_params)
      render json: { teacher: @teacher }, status: :ok
    else
      render json: @teacher.errors, status: :unprocessable_entity
    end
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def edit
    render json: { teacher: @teacher }, status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :not_found 
  end

  def destroy
    @teacher.destroy
    render json: { message: 'teacher is deleted'}, status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  private
  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(:t_name, :father_name, :gender, :date_of_birth, :t_address, :date_of_join, :teacher_id, :student, :teacherable_id, :teacherable_type)
  end
end