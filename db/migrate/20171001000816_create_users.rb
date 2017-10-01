class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :phone, :limit => 8
      t.string :password
      t.integer :prefProvider
      t.integer :prefAmount
      t.integer :prefLocation
      t.timestamps
    end
  end
end
