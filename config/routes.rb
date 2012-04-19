class UserConstraint
  def initialize
    @reserved_terms = ["search", "logout", "about", "help", "meet", "contact"]
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

  root :to => "index#index"
  
  # RESTful actions
  resources :roles, :only => [:new, :create, :update, :destroy]
  resources :users, :only => [:update]
  resources :media_collections, :path => "albums", :only => [:new, :create, :update, :destroy]
  resources :media_assets, :path => "media", :only => [:create, :update, :destroy]

  # Authentication routes
  match "/auth/facebook/callback" => "sessions#create"
  match "/logout" => "sessions#destroy", :as => "logout"
  
  # User and profile routes
  match "/:identifier/:role/edit" => "roles#edit", :as => 'custom_edit_role'
  match "/:identifier/:role" => "roles#show", :as => 'custom_role', :constraints => RoleConstraint.new
  match "/:identifier" => "users#show", :as => 'home', :constraints => UserConstraint.new
  
  # Media Collection routes
  match "/:identifier/:role/portfolio" => "media_collections#index", :as => 'portfolio'
  match "/:identifier/:role/album/:media_collection" => "media_collections#show", :as => 'custom_mc', :constraints => RoleConstraint.new
  match "/:identifier/:role/album/:media_collection/edit" => "media_collections#edit", :as => 'custom_edit_mc', :constraints => RoleConstraint.new
  match "/:identifier/:role/album/:media_collection/:media_asset" => "media_assets#show", :as => 'custom_media'
  
  # Project routes
  match "/:identifier/:role/projects(/:action)" => "projects", :as => 'projects'
  
  # Footer links related routes
  match "/about" => "index#about", :as => "about"
  match "/help" => "index#help", :as => "help"
  match "/meet" => "index#meet", :as => "meet"
  match "/contact" => "index#contact", :as => "contact"
  
end
