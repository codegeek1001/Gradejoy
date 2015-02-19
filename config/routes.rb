Gradejoy::Application.routes.draw do

  resources :categories

  devise_for :admins
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  resources :courses

  resources :assignments

  resources :students

  resources :course_enrollments

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

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
