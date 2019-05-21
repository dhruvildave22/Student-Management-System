class AnalyticsController < ApplicationController

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
    course = Course.find_by_course_type(params[:course_type]) 
    student = course.students
    render json: student
  end

  def get_students_by_exam
    exam = Exam.find_by_exam_name(params[:exam_name])
    students = exam.students
    render json: students
  end

  def get_teacher_by_subject
    teacher = Teacher.find_by_t_name(params[:t_name])
    subjects = teacher.subjects
    render json: subjects
  end

  def get_students_by_teacher_through_subject
    s1 = Subject.find_by(subject_name:params[:subject_name])
    all_teachers = s1.teachers

    render json: { teachers: all_teachers }
  end
end