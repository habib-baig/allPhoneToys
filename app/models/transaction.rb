class Transaction < ApplicationRecord
  belongs_to :user

  validates :amount, presence: true, numericality: { only_integer: true, less_than_or_equal_to:1000 }
  validates :phoneNumber, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1000000000 }, length: { is: 10 }
  

  scope :trans_user_name                 , -> (name) { joins(:user ).where( "lower(name) like ?", "%#{name.downcase}%" ) }
  scope :trans_amount                    , -> (amount                          ) { where "amount                       = ?", amount                       }
  scope :trans_phoneNumber               , -> (phoneNumber                     ) { where "phoneNumber like               ?", "%#{phoneNumber}%"           }
  scope :trans_provider                  , -> (provider                        ) { where "provider                     = ?", provider                     }
  scope :trans_location                  , -> (location                        ) { where "location                     = ?", location                     }
  scope :trans_status                    , -> (status                          ) { where "status                       = ?", status                       }
  scope :trans_scheduledPickupStartDT    , -> (scheduledPickupStartDT          ) { where "scheduledPickupStartDT       = ?", scheduledPickupStartDT       }
  scope :trans_scheduledPickupEndDT      , -> (scheduledPickupEndDT            ) { where "scheduledPickupEndDT         = ?", scheduledPickupEndDT         }
  scope :trans_messagedPickupDT          , -> (messagedPickupDT                ) { where "messagedPickupDT             = ?", messagedPickupDT             }
  scope :trans_pickedUpDT                , -> (pickedUpDT                      ) { where "pickedUpDT                   = ?", pickedUpDT                   }
  scope :trans_rechargeDueDT             , -> (rechargeDueDT                   ) { where "rechargeDueDT                = ?", rechargeDueDT                }
  scope :trans_rechargedDT               , -> (rechargedDT                     ) { where "rechargedDT                  = ?", rechargedDT                  }
  scope :trans_remarks                   , -> (remarks                         ) { where "remarks                      = ?", remarks}
  scope :trans_status_pickups                   , -> (                         ) { where "status                      = ? or status = ?",1,2 }
  scope :trans_status_recharges                   , -> (                         ) { where "status                      = ? or status = ?",2,3 }


end
