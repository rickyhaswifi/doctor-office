class ArticlesController < ApplicationController
  before_action :set_physician
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @physicians = Physician.all
    @article = @physician.articles.new
  end

  def create
    @article = @physician.articles.new(article_params)
    if @article.save
      redirect_to physician_articles_path(@physician)
    else
      render :new
    end
  end

  def update
    @physicians = Physician.all
    if @article.update(article_params)
      redirect_to physician_articles_path(@physician)
    else
      render :new
    end
  end

def show
end

def edit
  render :new
end

  def destroy
    @article.destroy
    redirect_to physician_articles_path(@physician)
    # redirect_to root_path
  end

  private
  def set_physician
    @physician = Physician.find(params[:physician_id]) 
  end

  def set_article
    @article = @physician.articles.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :author, :physician_id)
  end

end
