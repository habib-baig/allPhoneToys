class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :phone, :limit => 8
      t.string :password
      t.string :prefProvider
      t.integer :prefAmount
      t.string :prefLocation
      t.timestamps
    end
  end
end
