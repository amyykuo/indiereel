class UsersController < ApplicationController
  def show
    @user = User.find_by_uid(params[:uid])
  end
end
