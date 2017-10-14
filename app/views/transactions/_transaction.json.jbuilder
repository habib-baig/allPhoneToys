json.extract! transaction, :id, :amount, :phoneNumber, :provider, :location, :status, :scheduledPickupStartDT, :scheduledPickupEndDT, :messagedPickupDT, :pickedUpDT, :rechargeDueDT, :rechargedDT, :remarks, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
