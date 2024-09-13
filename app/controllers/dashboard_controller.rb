class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    @articles = Article.all
  end
end	