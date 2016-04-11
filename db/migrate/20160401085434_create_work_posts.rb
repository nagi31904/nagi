class CreateWorkPosts < ActiveRecord::Migration
  def change
    create_table :work_posts do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
