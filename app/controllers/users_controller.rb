class UsersController < ApplicationController
  def show
    @user = User.find_by_username(params[:identifier]) || User.find_by_uid(params[:identifier])
  end
end
