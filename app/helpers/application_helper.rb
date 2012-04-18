module ApplicationHelper
  
  def role_route(role)
    custom_role_path(role.user.identifier, role.role_type)
  end
  
  def edit_role_route(role)
    custom_edit_role_path(role.user.identifier, role.role_type)
  end
  
  def portfolio_route(role)
    portfolio_path(role.user.identifier, role.role_type)
  end
  
  def projects_route(role)
    projects_path(role.user.identifier, role.role_type)
  end
  
  def mc_route(mc)
    custom_mc_path(mc.role.user.identifier, mc.role.role_type, mc.id)
  end
  
  def edit_mc_route(mc)
    custom_edit_mc_path(mc.role.user.identifier, mc.role.role_type, mc.id)
  end
  
  def home_route(user)
    home_path(user.identifier)
  end
  
end
