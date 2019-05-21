Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :schools
  resources :teachers
  resources :subjects
  resources :exams
  resources :students
  resources :courses
  get '/get_students_by_queries', to: 'analytics#get_students_by_queries'
  get '/get_students_by_exam', to: 'analytics#get_students_by_exam'
  get '/get_students_by_course', to: 'analytics#get_students_by_course'
  get '/get_students_count_for_course', to: 'analytics#get_students_count_for_course'
  get '/get_teacher_by_subject', to: 'analytics#get_teacher_by_subject'
  get '/get_students_by_teacher_through_subject', to: 'analytics#get_students_by_teacher_through_subject'
end
