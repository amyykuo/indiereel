class UsersController < ApplicationController
  def show
    @user = User.find_by_identifier(params[:identifier])
    @roles = @user.roles rescue nil
    
    render 'public/404' if @user.nil?
  end
end
