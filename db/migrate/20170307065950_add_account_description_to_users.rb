class AddAccountDescriptionToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :account_description, :string
  end
end
