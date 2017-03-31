class AddNameToTestimony < ActiveRecord::Migration[5.0]
  def change
    add_column :testimonies, :name, :string
  end
end
