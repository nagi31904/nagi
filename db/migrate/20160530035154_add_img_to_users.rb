class AddImgToUsers < ActiveRecord::Migration
  def change
    add_attachment :users, :img
  end
end
