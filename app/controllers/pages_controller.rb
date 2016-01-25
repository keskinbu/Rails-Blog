class PagesController < ApplicationController
  
  def home
    set_meta_tags site: 'Burak Keskin', title: 'Homepage', reverse: true
    set_meta_tags description: ''
    set_meta_tags keywords: ''
    @articles = Article.paginate(page: params[:page], per_page: 3)
  end
  
  
  
  
end