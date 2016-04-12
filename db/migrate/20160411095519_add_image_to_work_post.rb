class AddImageToWorkPost < ActiveRecord::Migration
  def change
    add_attachment :work_posts, :img
  end
end
