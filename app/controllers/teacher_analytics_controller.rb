class TeacherAnalyticsController < ApplicationController

  def get_teachers_by_subject
    @teacher = Teacher.where("subject_name = ?", params[:subject_name])
    respond_to do |format|
      format.json { render json: @teacher, status: :ok}
    end
  end
end