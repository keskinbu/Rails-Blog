class Style < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 25 }
  has_many :article_styles
  has_many :articles, through: :article_styles
end