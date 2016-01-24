class CreateArticleStyles < ActiveRecord::Migration
  def change
    create_table :article_styles do |t|
      t.integer :style_id, :article_id
    end
  end
end
