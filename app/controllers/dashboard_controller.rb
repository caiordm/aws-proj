class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    @articles = Article.where(user_id: @user.id).order("created_at DESC")
  end
end	