class AddCategoryIdToLeague < ActiveRecord::Migration[6.1]
  def change
    add_column :leagues, :category_id, :integer
  end
end
