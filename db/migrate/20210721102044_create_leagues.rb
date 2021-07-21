class CreateLeagues < ActiveRecord::Migration[6.1]
  def change
    create_table :leagues do |t|
      t.string :Title
      t.text :Text

      t.timestamps
    end
  end
end
