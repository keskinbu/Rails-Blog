class Article < ActiveRecord::Base
   extend FriendlyId
   friendly_id :title, use: :slugged
  
   belongs_to :user
   has_many :likes
   has_many :article_styles
   has_many :styles, through: :article_styles
   validates :user_id, presence: true
   validates :title, presence:true, length: { minimum: 5, maximum: 100 }
   validates :content, presence:true, length: { minimum: 20 }
   validates :tags, presence:true
   mount_uploader :picture, PictureUploader
   validate :picture_size
   default_scope -> { order(created_at: :desc) }
   
   def thumbs_up_total
      self.likes.where(like: true).size
   end
   
   def thumbs_down_total
      self.likes.where(like: false).size
   end
   
   private
      def picture_size
         if picture.size > 5.megabytes
            errors.add(:picture, "Sould be less than 5MB")
         end
      end
end