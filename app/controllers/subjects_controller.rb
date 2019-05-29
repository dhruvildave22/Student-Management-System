class SubjectsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_subject, only: [:show, :update, :destroy, :edit]

  def index
    @subject = Subject.all
    render json: { subject: @subject }, status: :ok 
  end

  def show
    render json: { subject: @subject }, status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :not_found 
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
       render json: { subject: @subject }, status: :created
    else
      render json: @subject.errors, status: :unprocessable_entity 
    end
  end

  def update
    if @subject.update(subject_params)
      render json: { subject: @subject }, status: :ok 
    else
      render json: @subject.errors, status: :unprocessable_entity
    end
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity 
  end

  def edit
    render json: { subject: @subject }, status: :ok 
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :not_found
  end

  def destroy
    @subject.destroy
    render json: { message: 'subject is deleted'}, status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :unprocessable_entity 
  end

  private
  def set_subject
    @subject = Subject.find(params[:id])
  end

  def subject_params
    params.require(:subject).permit(:subject_name, :teacher_id)
  end
end