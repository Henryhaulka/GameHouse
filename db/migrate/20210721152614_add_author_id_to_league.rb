class AddAuthorIdToLeague < ActiveRecord::Migration[6.1]
  def change
    add_column :leagues, :author_id, :integer
  end
end
