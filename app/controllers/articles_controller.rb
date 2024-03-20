class ArticlesController < ApplicationController
  before_action :load_article, except: [:index, :new, :create]
  
  def original_url
     base_url + original_fullpath
  end
  
  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end

  def create
    @article = Article.new article_params
    @article.user_name = current_user.username
    @article.user = current_user
    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end

  def show
    @articles = Article.all
    @comment = Comment.new
  end

  def edit
  end

  def update
    if @article.update article_params
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end
  
  private
  def load_article
    @article = Article.find params[:id]
  end
  
  def article_params
    params.require(:article).permit(:title,:author,:body,:user_name,:user_id)
  end
  
end
