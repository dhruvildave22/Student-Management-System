Rails.application.routes.draw do
  resources :schools
  resources :teachers
  resources :subjects
  resources :exams
  resources :students
  resources :courses
  resource :analytics, only: [:new]
  get 'analytics/get_students_by_queries', to: 'analytics#get_students_by_queries'
  get 'analytics/get_students_by_exam', to: 'analytics#get_students_by_exam'
  get 'analytics/get_students_by_course', to: 'analytics#get_students_by_course'
  get 'analytics/get_students_count_for_course', to: 'analytics#get_students_count_for_course'
  get 'analytics/get_teacher_by_subject', to: 'analytics#get_teacher_by_subject'
  get 'analytics/get_students_by_teacher_through_subject', to: 'analytics#get_students_by_teacher_through_subject'
  get 'partials/update_school_and_teacher_code', to: 'partials#update_school_and_teacher_code'
end
 