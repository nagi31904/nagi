class CreateWorkCategoryPosts < ActiveRecord::Migration
  def change
    create_table :work_category_posts do |t|
      t.integer :work_post_id
      t.integer :work_category_id

      t.timestamps null: false
    end
  end
end
