class RolesController < ApplicationController
  def show
    @user = User.find_by_identifier params[:identifier]
    @role = Role.find_by_role_type_and_user_id(params[:role], @user.id) rescue nil
    render_not_found and return if @role.nil?
    
    @private_mode = current_user.uid == @user.uid
    
    @preview = params[:preview] rescue false
    @headshot = @role.headshots
    @portfolio_album = @role.portfolio_album rescue nil
    
    @att_filled = {}
    
    for k, v in Role.role_attributes
      @att_filled[k] = false
      for val in v
        if !@role[val].empty?
          @att_filled[k] = true
        end
      end
    end
    
    @basic_info_filled = @att_filled.has_value?(true)
  end
  
  def new
    @user = current_user
    @ages = Role.ages
    @options = @user.remaining_role_options.map{|role| [role.capitalize, role]}
  end
  
  def create
    if Role.where(:user_id => current_user.id, :role_type => params[:role][:role_type]).exists?
      flash[:error] = "You already have a #{params[:role][:role_type].capitalize} role."
      redirect_to home_route(current_user)
    elsif (role = Role.create params[:role]).invalid?
      flash[:error] = "The role was invalid. Please try again."
      redirect_to new_role_path
    else
      # TODO: default role
      role.media_collections << MediaCollection.create_quickshow << MediaCollection.create_headshot
      role.save
      flash[:notice] = "Role created successfully."
      redirect_to role_route(role)
    end
  end
  
  def edit
    @user = User.find_by_identifier params[:identifier]
    @role = Role.find_by_role_type_and_user_id(params[:role], @user.id) rescue nil
    @ages = Role.ages
    
    render_not_found if @user.nil? or @user.id != current_user.id or @role.nil?
  end
  
  def update
    @role = Role.find params[:id]
    @role.update_attributes params[:role]
    
    if @role.valid?
      flash[:notice] = "#{@role.role_type.capitalize} was successfully updated."
      redirect_to role_route(@role)
    else
      flash[:error] = "There were some errors in updating your role."
      redirect_to edit_role_route(@role)
    end
  end
  
  def destroy
    role = Role.find params[:id]
    
	  if current_user.identifier == role.user.identifier
      role.destroy
      flash[:notice] = "Role deleted."
    else
      flash[:error] = "You cannot delete this role."
    end
	  
    redirect_to home_route(current_user)
    
  end
  
  def search
    @selected = []
    
    @selected << params[:check3] << params[:check2] << params[:check1] << params[:check4]
    @search = Role.search do
      words = (params[:query].nil? ? "" : params[:query]).gsub(/[-\+\"]{1}/, '').strip.downcase
      words = params[:check1].nil? ? words : words + " " + params[:check1]
      words = params[:check2].nil? ? words : words + " " + params[:check2]
      words = params[:check3].nil? ? words : words + " " + params[:check3]
      words = params[:check4].nil? ? words : words + " " + params[:check4]
      
      if params[:query] == ""
        keywords words do
          minimum_match 1
        end
      else
        keywords words do
          minimum_match 2
        end
      end
    end
    
    if params[:query].nil? && params[:check3].nil? && params[:check2].nil? && params[:check1].nil? && params[:check4].nil?
      @search_results = nil
    elsif params[:query].empty? && params[:check3].nil? && params[:check2].nil? && params[:check1].nil? && params[:check4].nil?
      @search_results = nil
    else
      @search_results = @search.results
    end
  end
end
