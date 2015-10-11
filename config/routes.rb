Rails.application.routes.draw do
  resources :assignments
  resources :categories
  resources :course_assignments
  resources :course_enrollments do
    member do
      put 'mark_inactive'
    end
  end
  resources :courses
  resources :grades
  resources :students
  devise_for :users

  get "courses/:id/enroll_student/new(.:format)", to: "enroll_student#new"

  post "courses/:id/enroll_student/new(.:format)", to: "enroll_student#create"

  get "courses/:id/create_assignment_and_course_assignment/new(.:format)", to: "create_assignment_and_course_assignment#new"

  post "courses/:id/create_assignment_and_course_assignment/new(.:format)", to: "create_assignment_and_course_assignment#create"

  get "courses/:id/grades/:assignment_id/:student_id/new(.:format)", to: "grades#new"

  post "courses/:id/grades/:assignment_id/:student_id/new(.:format)", to: "grades#create"

  get "courses/:id/grades/:assignment_id/:student_id/edit(.:format)", to: "grades#edit"

  patch "courses/:id/grades/:assignment_id/:student_id/update(.:format)", to: "grades#update"

  get "about" =>         "pages#about"
  get "contact" =>       "pages#contact"
  get "help" =>          "pages#help"
  get "privacy" =>       "pages#privacy"
  get "terms" =>         "pages#terms"
  get "account" =>       "pages#account"

  get '/robots.:format' => 'pages#robots'
  root "pages#index"
end
