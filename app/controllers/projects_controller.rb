class ProjectsController < ApplicationController
  def index
    @user = User.find_by_identifier(params[:identifier])
    @role = params[:role]
  end
end
