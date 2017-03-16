class CreatePackages < ActiveRecord::Migration[5.0]
  def change
    create_table :packages do |t|
      t.string :name
      t.string :amount
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
