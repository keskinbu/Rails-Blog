class ArticlesController < ApplicationController
  
  def index
    @articles = Article.paginate(page: params[:page], per_page: 3)
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
  
  def like
    @article = Article.find(params[:id])
    like = Like.create(like: params[:like], user: User.first, article: @article)
    if like.valid?
      flash[:success] = "Your selection was succesful"
      redirect_to :back
    else
      flash[:danger] = "You can only like/dislike a article once"
      redirect_to :back
    end
  end
  
  private
  
    def article_params
      params.require(:article).permit(:title, :content, :tags, :picture)
    end
      
end