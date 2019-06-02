class SchoolsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :update_transactions_filter, :only => [:show]

  def index
    school = School.all
    render json: { school: school }, status: :ok 
  end

  def show
    school = School.find(params[:id])
    render json: { school: school }, status: :ok 
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :not_found 
  end

  def create
    school = School.new(school_params)
    if school.save
      render json: { school: school }, status: :created 
      else
      render json: school.errors, status: :unprocessable_entity 
    end
  rescue => e
    render json: { error: e.message }, status: :unprocessable_entity  
  end

  def update
    school = School.find(params[:id])
    if school.update(school_params)
      render json: { school: school }, status: :ok 
    else
      render json: school.errors, status: :unprocessable_entity
    end
  rescue => e
    render json: { error: e.message }, status: :unprocessable_entity 
  end

  def destroy
    school = School.find(params[:id])
    school.destroy
    render json: { message: 'school is deleted'}, status: :ok
  rescue ActiveRecord::InvalidForeignKey => e
    render json: { error: 'foreignKeyViolation school can not be deleted'}, status: :internal_server_error    
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :unprocessable_entity 
  end

  private
  def school_params
    params.require(:school).permit(:s_name, :s_address, :phone_no, :school_code)
  end 
end

