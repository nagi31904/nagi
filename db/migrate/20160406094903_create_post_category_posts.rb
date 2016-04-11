class CreatePostCategoryPosts < ActiveRecord::Migration
  def change
    create_table :post_category_posts do |t|
      t.integer :post_id
      t.integer :post_category_id

      t.timestamps null: false
    end
  end
end
