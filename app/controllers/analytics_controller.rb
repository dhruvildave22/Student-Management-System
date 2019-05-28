class AnalyticsController < ApplicationController
  include AnalyticsHelper
  def get_students_by_queries
    student = Student.where("std_date_of_join >= ?", params[:start_date])
      respond_to do |format|
      format.json { render json: student, status: :ok}
    end
  end

  def get_students_count_for_course
    get_course = Course.find_by_course_type(params[:course_type]) 
    get_student = get_course.students.count
    render json: get_student
  end

  def get_students_by_course
    @all_student = get_student_using_course(params[:course_type])
    respond_to do |format|
      format.html {}
      format.json { render json: { students: @all_student }, status: :ok }
    end
  end

  def get_students_by_exam
    exam = Exam.find_by_exam_name(params[:exam_name])
    students = exam.students
    render json: students
  end

  def get_teacher_by_subject
    get_subject = Subject.find_by_subject_name(params[:subject_name])
    all_teachers = get_subject.teachers
    render json: all_teachers
  end

  def get_students_by_teacher_through_subject
    s1 = Subject.find_by(subject_name:params[:subject_name])
    get_teacher = s1.teachers
    get_student = []
    get_teacher.each do |t|
      get_student.push(t.students)
    end
    render json: { req: get_student }
  end
end