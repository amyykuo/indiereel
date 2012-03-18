class PortfoliosController < ApplicationController
  def show
    @user = User.find_by_identifier(params[:identifier])
    @role = params[:role]
  end
end
