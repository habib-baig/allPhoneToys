class User < ApplicationRecord
  has_many :transactions

  validates :name,  presence: true, length: { maximum: 50 }

  validates :password,  presence: true, length: { maximum: 50 }

  validates :prefAmount,numericality: { only_integer: true, less_than_or_equal_to:1000 }

  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => Devise::email_regexp
  
  validates :phone, numericality: { only_integer: true, greater_than_or_equal_to: 1000000000 }, length: { is: 10 }
  before_create { generate_token(:auth_token) }
  def passwordMatches(enteredPassword)
    enteredPassword.eql?self.password
  end

  scope :user_name, -> (name) { where "lower(name) like ?", "%#{name.downcase}%" }
  scope :user_email, -> (email) { where "lower(email) like ?", "%#{email.downcase}%" }
  scope :user_phone, -> (phone) { where "phone = ?", phone }
  scope :user_pref_amount, -> (prefAmount) { where "prefAmount = ?", prefAmount }
  scope :user_pref_provider, -> (prefProvider) { where "prefProvider = ?", prefProvider }
  scope :user_pref_location, -> (prefLocation) { where "prefLocation = ?", prefLocation }

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

end
