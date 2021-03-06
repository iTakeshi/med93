Med93::Application.routes.draw do

=begin
  match 'subject/:id', to: 'subject#subject'
  match '/bbs_bodies/return_bbs_data/:bbs_topic_id/:page', to: 'bbs_bodies#return_bbs_data'
  match '/bbs_bodies/create_bbs_window/:bbs_topic_id/', to: 'bbs_bodies#create_bbs_window'
  get '/admin/index', to: 'admin#index'
  get '/admin/system', to: 'admin#system'
  get '/admin/system/invite_members', to: 'users#invite_from_list'
  match ':controller(/:action(/:id(.:format)))'
=end

  root to: 'index#index'

  get '/login', to: 'sessions#new'
  post 'sessions/create', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  match '/profile/:action', controller: 'profile'

  match '/admin/:action', controller: 'admin'
  match '/system/:action(/:id)', controller: 'system'

  match '/subject/:action(/:id)', controller: 'subject'
  get '/exams/download'
  get '/quizzes/download'
  get '/summaries/download'

  get '/calender/index'
  get '/bbs/index'
  get '/mail/index'
  get '/index/sns'
  get '/index/about'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
