class AddIndexToMatches < ActiveRecord::Migration[5.0]
  def change
  	add_index :matches, :receiver_id
    add_index :matches, :giver_id
    add_index :matches, [:receiver_id, :giver_id], unique: true
  end
end
