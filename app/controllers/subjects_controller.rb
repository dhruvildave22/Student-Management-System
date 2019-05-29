class SubjectsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_subject, only: [:show, :update, :destroy, :edit]

  def index
    @subject = Subject.all
    respond_to do |format|
      format.json { render json: { subject: @subject }, status: :ok }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: { subject: @subject }, status: :ok }
    end
  rescue ActiveRecord::RecordNotFound => e
    respond_to do |format|
      format.json { render json: { error: e.message }, status: :not_found }
    end
  end

  def create
    @subject = Subject.new(subject_params)
    respond_to do |format|
      if @subject.save
        format.json { render json: { subject: @subject }, status: :created }
      else
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.json { render json: { subject: @subject }, status: :ok }
      else
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  rescue StandardError => e
    respond_to do |format|
      format.json { render json: { error: e.message }, status: :unprocessable_entity }
    end
  end

  def edit
    respond_to do |format|
      format.json { render json: { subject: @subject }, status: :ok }
    end
  rescue ActiveRecord::RecordNotFound => e
    respond_to do |format|
      format.json { render json: { error: e.message }, status: :not_found }
    end
  end

  def destroy
    respond_to do |format|
      @subject.destroy
      format.json { render json: {}, status: :ok }
    end
  rescue ActiveRecord::RecordNotFound => e
    respond_to do |format|
      format.json { render json: { error: e.message }, status: :unprocessable_entity }
    end
  end

  private
  def set_subject
    @subject = Subject.find(params[:id])
  end

  def subject_params
    params.require(:subject).permit(:subject_name, :teacher_id)
  end
end