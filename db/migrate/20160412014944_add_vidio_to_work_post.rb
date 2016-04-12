class AddVidioToWorkPost < ActiveRecord::Migration
  def change
    add_column :work_posts, :ved, :string
  end
end
