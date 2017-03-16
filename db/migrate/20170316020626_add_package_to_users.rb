class AddPackageToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :package, :string
  end
end
