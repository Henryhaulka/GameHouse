class AddAttachmentImageToLeagues < ActiveRecord::Migration[4.2]
  def self.up
    change_table :leagues do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :leagues, :image
  end
end
