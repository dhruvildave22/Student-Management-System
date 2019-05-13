class SchoolsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_school, only: [:show, :update, :destroy]

  def index
    @school = School.all
    render json: @school, each_serializer: SchoolSerializer
  end

  # def new
  #   @school = School.new
  # end

  def show
    respond_to do |format|
      format.json { render json: @school, status: :ok }
    end
    rescue ActiveRecord::RecordNotFound => e
      respond_to do |format|
      format.json { render json: { error: e.message }, status: :not_found }
    end
  end

  def create
    @school = School.create(school_params)
    respond_to do |format|
      if @school.save
        format.json { render json: @school, status: :created }
      else
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
    rescue ActiveRecord::InvalidRecord => e
      respond_to do |format|
      format.json { render json: { error: e.message }, status: :not_found }
    end
  end


  def edit
  end


  def update
    respond_to do |format|
      if @school.update(school_params)
        render json: @school
      else
        render json: @school.errors, status: :unprocessable_entity
      end
    end
  rescue ActiveRecord::InvalidRecord => e
    respond_to do |format|
      format.json { render json: { error: e.message }, status: :not_found }
    end
  end


  def destroy
    @school.destroy
  end


  private

  def set_school
   @school = School.find(params[:id])
  end

  def school_params
    params.require(:school).permit(:s_name, :s_address, :phone_no)
  end
end

