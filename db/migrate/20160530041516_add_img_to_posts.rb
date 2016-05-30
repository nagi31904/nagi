class AddImgToPosts < ActiveRecord::Migration
  def change
    add_attachment :posts, :img
  end
end
