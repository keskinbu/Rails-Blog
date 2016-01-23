class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    @article.user = User.find(1)
    
    if @article.save
      flash[:success] = "Your article was created succesfully!"
      redirect_to articles_path
    else
      render :new
    end
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = "Your article was updated succesfully!"
      redirect_to article_path(@article)
    else
      render :edit
    end
  end
  
  private
  
    def article_params
      params.require(:article).permit(:title, :content, :tags)
    end
      
end