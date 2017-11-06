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

  def passwordMatches(enteredPassword)
    enteredPassword.eql?self.password
  end

  scope :user_name, -> (name) { where "lower(name) like ?", "%#{name.downcase}%" }
  scope :user_email, -> (email) { where "lower(email) like ?", "%#{email.downcase}%" }
  scope :user_phone, -> (phone) { where "phone = ?", phone }
  scope :user_pref_amount, -> (prefAmount) { where "prefAmount = ?", prefAmount }
  scope :user_pref_provider, -> (prefProvider) { where "prefProvider = ?", prefProvider }
  scope :user_pref_location, -> (prefLocation) { where "prefLocation = ?", prefLocation }


end
