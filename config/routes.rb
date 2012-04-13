class UserConstraint
  def initialize
    @reserved_terms = ["search", "logout"]
  end
  
  def matches?(request)
    not @reserved_terms.include? request.params[:identifier]
  end
end

class RoleConstraint
  def initialize
    @options = Role.options + Role.legacy_options
  end
  
  def matches?(request)
    @options.include? request.params[:role]
  end
end

Indiereel::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  root :to => "index#index"

  # Authentication related routes
  match "/auth/facebook/callback" => "sessions#create"
  match "/logout" => "sessions#destroy", :as => 'logout'

  resources :roles
  resources :users
  resources :media_collections

  # User and profile related routes
  match "/:identifier/:role/projects(/:action)" => "projects", :as => 'projects'
  match "/:identifier/:role/portfolio(/:action)" => "portfolios", :as => 'portfolio', :defaults => {:action => "show"}
  match "/:identifier/:role/edit" => "roles#edit", :as => 'custom_edit_role'
  match "/:identifier/:role" => "roles#show", :as => 'custom_role', :constraints => RoleConstraint.new
  match "/:identifier" => "users#show", :as => 'home', :constraints => UserConstraint.new
  
  # media collection relate routes
  match "/:identifier/:role/album/:media_collection" => "media_collections#show", :as => 'custom_mc', :constraints => RoleConstraint.new
  match "/:identifier/:role/album/:media_collection/edit" => "media_collections#edit", :as => 'custom_edit_mc', :constraints => RoleConstraint.new
  match "/:identifier/:role/album/new" => "media_collections#new", :as => 'custom_new_mc', :constraints => RoleConstraint.new
  
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
  # just remember to delete public/welcome.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
