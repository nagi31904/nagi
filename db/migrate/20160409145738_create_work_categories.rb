class CreateWorkCategories < ActiveRecord::Migration
  def change
    create_table :work_categories do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
