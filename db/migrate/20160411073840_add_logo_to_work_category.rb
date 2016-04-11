class AddLogoToWorkCategory < ActiveRecord::Migration
  def change
    add_attachment :work_categories, :logo
  end
end
