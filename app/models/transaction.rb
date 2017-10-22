class Transaction < ApplicationRecord
  belongs_to :user
  enum providers: { Lyca: 1 , T_My_Mobile: 2 ,Verizon: 3 }
  enum locations: { College_Main: 1 , Cherry_Hollows: 2 , Gardens: 3 , Scandia: 4 }
end
