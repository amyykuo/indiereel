class UsersController < ApplicationController
  def show
    @user = User.find_by_identifier(params[:identifier])
    @roles = @user.roles
  end
end
