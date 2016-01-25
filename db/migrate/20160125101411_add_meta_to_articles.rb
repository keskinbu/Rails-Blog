class AddMetaToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :summary, :string
  end
end
