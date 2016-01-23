class Article < ActiveRecord::Base
   belongs_to :user
   validates :user_id, presence: true
   validates :title, presence:true, length: { minimum: 5, maximum: 100 }
   validates :content, presence:true, length: { minimum: 20 }
    
end