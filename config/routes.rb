HouddPre::Application.routes.draw do

  match '/smalltrials/:id/log' => 'smalltrials#log', as: 'log_smalltrial', :via => :get
  match '/smalltrials/:id/execute' => 'smalltrials#execute'
  match '/smalltrials/:id/check_log' => 'smalltrials#check_log'
  match '/smalltrials/select_mobunits'
  match '/smalltrials/:id/select_mobunits' => 'smalltrials#select_mobunits'
  resources :smalltrials

  resources :smalltrialstatuses

  match '/smallmobunits/select_map'
  match '/smallmobunits/:id/select_map' => 'smallmobunits#select_map'
  match '/smallmobunits/select_squad'
  match '/smallmobunits/:id/select_squad' => 'smallmobunits#select_squad'
  resources :smallmobunits

  match '/smallmobsquads/select_mob_and_unit'
  match '/smallmobsquads/:id/select_mob_and_unit' => 'smallmobsquads#select_mob_and_unit'
  resources :smallmobsquads

  resources :smallstrategies

  match '/smallmobgroups/select_mob'
  match '/smallmobgroups/:id/select_mob' => 'smallmobgroups#select_mob'
  match '/smalltops/:id/portal' => 'smalltops#portal', as: 'portal_smalltops', :via => :get
  resources :smalltops

  resources :smallweponinfos

  resources :smallarmorinfos

  match '/smallmobs/select_squad'
  match '/smallmobs/:id/select_squad' => 'smallmobs#select_squad'
  resources :smallmobs

  resources :smallmagicinfos

  resources :smallmobinfos

  resources :smallmaps

  resources :smallusers

  resources :mosttinymobtrails

  resources :mosttinybattles

  resources :mosttinystrategies

  resources :mosttinymobsetups

  resources :mosttinymobs

  resources :mosttinymobinfos

  resources :mosttinymaps

  resources :mosttinyturns

  match '/mosttinytrials/select_map_and_def_mobs'
  match '/mosttinytrials/:id/select_map_and_def_mobs' => 'mosttinytrials#select_map_and_def_mobs'
  match '/mosttinytrials/select_atk_mobs'
  match '/mosttinytrials/:id/select_atk_mobs' => 'mosttinytrials#select_atk_mobs'
  match '/mosttinytrials/:id/start' => 'mosttinytrials#start', as: 'start_mosttinytrial', :via => :get
  match '/mosttinytrials/:id/execute' => 'mosttinytrials#execute'
  match '/mosttinytrials/:id/check_log' => 'mosttinytrials#check_log'
  resources :mosttinytrials

  resources :mosttinyusers

  resources :moretinymobbattles

  resources :moretinymobtrails

  resources :moretinymobs

  resources :moretinymobinfos

  resources :moretinymaps

  resources :tinymaps
  resources :tinymap2s

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
  # match ':controller(/:action(/:id))(.:format)'
end
