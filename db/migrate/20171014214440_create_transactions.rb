class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :amount
      t.integer :phoneNumber, :limit => 8
      t.integer :provider
      t.integer :location
      t.integer :status
      t.datetime :scheduledPickupStartDT
      t.datetime :scheduledPickupEndDT
      t.datetime :messagedPickupDT
      t.datetime :pickedUpDT
      t.datetime :rechargeDueDT
      t.datetime :rechargedDT
      t.text :remarks

      t.timestamps
    end
  end
end
