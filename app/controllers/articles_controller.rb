class ArticlesController < ApplicationController
  
  before_action :set_article, only: [:edit, :update, :show, :like]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update]
  
  def index
    @articles = Article.paginate(page: params[:page], per_page: 3)
  end
  
  def show
    
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    @article.user = current_user
    
    if @article.save
      flash[:success] = "Your article was created succesfully!"
      redirect_to articles_path
    else
      render :new
    end
  end
  
  def edit
    
  end
  
  def update
    if @article.update(article_params)
      flash[:success] = "Your article was updated succesfully!"
      redirect_to article_path(@article)
    else
      render :edit
    end
  end
  
  def like
    like = Like.create(like: params[:like], user: current_user, article: @article)
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
    
    def set_article
      @article = Article.find(params[:id])
    end
      
    def require_same_user
      if current_user != @article.user
        flash[:danager] = "You can only edit own your articles"
        redirect_to articles_path
      end
    end
    
    def require_user
      if !logged_in?
        flash[:danger] = "You must be logged in to perform that action"
        redirect_to :back
      end
    end
end