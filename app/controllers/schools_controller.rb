class SchoolsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_school, only: [:show, :update, :edit, :destroy]

  def index
    @school = School.all
    respond_to do |format|
      format.json { render json: { school: @school }, status: :ok }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: { school: @school }, status: :ok }
    end
  rescue ActiveRecord::RecordNotFound => e
    respond_to do |format|
      format.json { render json: { error: e.message }, status: :not_found }
    end
  end


  def create
    @school = School.new(school_params)
    respond_to do |format|
      if @school.save
        format.json { render json: { school: @school }, status: :created }
      else
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @school.update(school_params)
        format.json { render json: { school: @school }, status: :ok }
      else
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  rescue StandardError => e
    respond_to do |format|
      format.json { render json: { error: e.message }, status: :unprocessable_entity }
    end
  end

  def edit
    respond_to do |format|
      format.json { render json: { school: @school }, status: :ok }
    end
  rescue ActiveRecord::RecordNotFound => e
    respond_to do |format|
      format.json { render json: { error: e.message }, status: :not_found }
    end
  end

  def destroy
    respond_to do |format|
      @school.destroy
      format.json { render json: {}, status: :ok }
    end
  rescue ActiveRecord::RecordNotFound => e
    respond_to do |format|
      format.json { render json: { error: e.message }, status: :unprocessable_entity }
    end
  end

  private
  def set_school
   @school = School.find(params[:id])
  end

  def school_params
    params.require(:school).permit(:s_name, :s_address, :phone_no)
  end
end

