class AddUserIdToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :user_id, :integer
  end
end
