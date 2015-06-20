Rails.application.routes.draw do

  resources :categories

  devise_for :users

  resources :courses

  resources :assignments

  resources :students

  resources :course_enrollments do
    member do
      put 'mark_inactive'
    end
  end

  resources :course_assignments

  get "about" =>         "pages#about"
  get "contact" =>       "pages#contact"
  get "help" =>          "pages#help"
  get "privacy" =>       "pages#privacy"
  get "terms" =>         "pages#terms"
  get "account" =>       "pages#account"
  get "communication" => "pages#communication"

  root "pages#index"

  get "courses/:id/enroll_student/new(.:format)", to: "enroll_student#new"

  post "courses/:id/enroll_student/new(.:format)", to: "enroll_student#create"

  get "courses/:id/course_assignment/new(.:format)", to: "course_assignment#new"

  post "courses/:id/course_assignment/new(.:format)", to: "course_assignment#create"

  get "courses/:id/course_assignment/show(.:format)", to: "course_assignment#show"

  get "courses/:id/grades/:assignment_id/:student_id/new(.:format)", to: "grades#new"

  post "courses/:id/grades/:assignment_id/:student_id/new(.:format)", to: "grades#create"

  get "courses/:id/grades/:assignment_id/:student_id/edit(.:format)", to: "grades#edit"

  patch "courses/:id/grades/:assignment_id/:student_id/update(.:format)", to: "grades#update"

  get '/robots.:format' => 'pages#robots'
end
