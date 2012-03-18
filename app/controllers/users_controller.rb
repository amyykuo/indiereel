class UsersController < ApplicationController
  def show
    @user = User.find_by_identifier(params[:identifier])
  end
end
