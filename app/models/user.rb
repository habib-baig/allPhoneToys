class User < ApplicationRecord

  validates :name,  presence: true, length: { maximum: 50 }

  validates :password,  presence: true, length: { maximum: 50 }

  validates :prefAmount,numericality: { only_integer: true, less_than_or_equal_to:1000 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX }
  validates :phone, numericality: { only_integer: true, greater_than_or_equal_to: 1000000000 }, length: { is: 10 }

  enum prefProvider: { Lyca: 'Lyca_Mobile', TMobile: 'T- Mobile',Verizon: 'Verizon'}
  PREF_PROVIDER = User.prefProviders.map { |k, v| [k.to_s.humanize, v] }

  validates :prefProvider, presence: true

  enum prefLocation: { College_Main: 'college-mains', Cherry_Hollows: 'cherry_hollows', Gardens: 'Gardens', Scandia: 'Scandia'}
  PREF_LOCATION = User.prefLocations.map { |k, v| [k.to_s.humanize, v] }

  validates :prefLocation, presence: true

  def passwordMatches(enteredPassword)
    enteredPassword.eql?self.password
  end

end
