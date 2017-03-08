class CreateAnnouncements < ActiveRecord::Migration[5.0]
  def change
    create_table :announcements do |t|
      t.text :text
      t.boolean :published

      t.timestamps
    end
  end
end
