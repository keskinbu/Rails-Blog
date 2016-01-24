class Article < ActiveRecord::Base
   belongs_to :user
   validates :user_id, presence: true
   validates :title, presence:true, length: { minimum: 5, maximum: 100 }
   validates :content, presence:true, length: { minimum: 20 }
   validates :tags, presence:true
   mount_uploader :picture, PictureUploader
   validate :picture_size
   
   private
      def picture_size
         if picture.size > 5.megabytes
            errors.add(:picture, "Sould be less than 5MB")
         end
      end
end