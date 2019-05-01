class StudentsController < ApplicationController
  def index
    @subject = Subject.all
  end

  def new
    @subject = Subject.new
  end

  def create
    @teacher = Teacher.find(params[:teacher_id])
    @subject = @teacher.subjects.create(subject_params)
    if @subject.save
      redirect_to @subject
    else
      render 'new'
    end
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update(subject_params)
      redirect_to @subject
    else
      render 'new'
    end
  end

  def destroy
    @teacher = Teacher.find(params[:teacher_id])
    @subject = @teacher.subjects.find(params[:id])
    @subject.destroy

    redirect_to 'new'
  end

  private

  def subject_params
    params.require(:student).permit(:subject_name, :teacher_id)
  end
end