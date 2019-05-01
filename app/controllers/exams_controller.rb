class ExamsController < ApplicationController
   def index
    @exam = Exam.all
  end

  def new
    @exam = Exam.new
  end

  def create
    @subject = Subject.find(params[:subject_id])
    @exam = @subject.exams.create(exam_params)
    if @exam.save
      redirect_to @exam
    else
      render 'new'
    end
  end

  def show
    @exam = Exam.find(params[:id])
  end

  def update
    @exam = Exam.find(params[:id])
    if @exam.update(exam_params)
      redirect_to @exam
    else
      render 'new'
    end
  end

  def destroy
    @subject = Subject.find(params[:subject_id])
    @exam = @subject.exams.find(params[:id])
    @exam.destroy

    redirect_to 'new'
  end

  private

  def exam_params
    params.require(:exam).permit(:exam_name, :exam_duration, :subject_id)
  end

end