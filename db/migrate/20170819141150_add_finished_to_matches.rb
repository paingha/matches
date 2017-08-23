class AddFinishedToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :finished, :boolean, default: false
  end
end
