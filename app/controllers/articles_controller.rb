class ArticlesController < ApplicationController
  def index
    @user = current_user
    @articles = Article.all
  end

  def show
    @user = current_user
    @article = Article.find(params[:id])
  end

  def new
    @user = current_user
    @article = Article.new
  end

  def create
    @article = Article.new(article_params.merge(user: current_user))

    if @article.save
      redirect_to @article
    else
      render :articles_path, status: :unprocessable_entity
    end
  end

  def edit
    @user = current_user
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path, status: :see_other
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :image)
    end
end
