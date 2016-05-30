class AddImgToInfos < ActiveRecord::Migration
  def change
    add_attachment :infos, :img
  end
end
