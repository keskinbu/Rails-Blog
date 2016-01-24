class PagesController < ApplicationController
  
  def home
    @articles = Article.paginate(page: params[:page], per_page: 3)
  end
  
  
  
  
end