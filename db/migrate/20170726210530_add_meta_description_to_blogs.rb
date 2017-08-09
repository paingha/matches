class AddMetaDescriptionToBlogs < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :meta_description, :text
  end
end
