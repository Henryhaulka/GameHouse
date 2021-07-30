class CreateRelates < ActiveRecord::Migration[6.1]
  def change
    create_table :relates do |t|
      t.references :league, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
