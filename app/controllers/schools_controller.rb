class SchoolsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_school, only: [:show, :update, :edit, :destroy]

  def index
    @school = School.all
    render json: { school: @school }, status: :ok 
  end

  def show
    render json: { school: @school }, status: :ok 
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :not_found 
  end

  def create
    @school = School.new(school_params)
    if @school.save
      render json: { school: @school }, status: :created 
    else
      render json: @school.errors, status: :unprocessable_entity 
    end
  end

  def update
    if @school.update(school_params)
      render json: { school: @school }, status: :ok 
    else
      render json: @school.errors, status: :unprocessable_entity
    end
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity 
  end

  def edit
    render json: { school: @school }, status: :ok 
  rescue ActiveRecord::RecordNotFound => e
     render json: { error: e.message }, status: :not_found 
  end

  def destroy
    @school.destroy
    render json: { message: 'school is deleted'}, status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :unprocessable_entity 
  end

  private
  def set_school
   @school = School.find(params[:id])
  end

  def school_params
    params.require(:school).permit(:s_name, :s_address, :phone_no)
  end
end

