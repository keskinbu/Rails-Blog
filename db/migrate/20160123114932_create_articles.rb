class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.string :tags, :status
      t.integer :user_id, :is_active
      t.timestamps
    end
  end
end
