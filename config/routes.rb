Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :schools, shallow: true do
    resources :teachers, shallow: true do
      resources :subjects, shallow: true do
        resources :exams, shallow: true do
        end
      end
    end
    resources :students
    resources :courses
  end
end
