class ArticleStyle < ActiveRecord::Base
  belongs_to :article
  belongs_to :style
end