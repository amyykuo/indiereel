class PortfoliosController < ApplicationController
  def show
    @user = User.find_by_identifier(params[:identifier])
    @role = Role.find_by_name_and_user_id(params[:role], @user.id)
  end
end
