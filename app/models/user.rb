class User < ApplicationRecord
  has_many :transactions

  validates_uniqueness_of :email

  validates :name,  presence: true, length: { maximum: 50 }

  validates :password,  presence: true, length: { maximum: 50 }

  validates :prefAmount,numericality: { only_integer: true, less_than_or_equal_to:1000 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX }
  validates :phone, numericality: { only_integer: true, greater_than_or_equal_to: 1000000000 }, length: { is: 10 }

  enum prefProvider: { Lyca: 1 , T_My_Mobile: 2 ,Verizon: 3 }
  enum prefLocation: { College_Main: 1 , Cherry_Hollows: 2 , Gardens: 3 , Scandia: 4 }


  def passwordMatches(enteredPassword)
    enteredPassword.eql?self.password
  end



end
