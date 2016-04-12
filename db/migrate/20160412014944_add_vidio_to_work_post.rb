class AddVidioToWorkPost < ActiveRecord::Migration
  def change
    add_column :work_posts, :vedio_url, :string
  end
end
