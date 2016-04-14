class User < ActiveRecord::Base
  has_secure_password
  
  validates :name, presence: true, length: { maximum: 255 }
  validates :last_name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, email_format: true, uniqueness: true
  validates :password, confirmation: true, length: { minimum: 6}

  before_create {generate_token(:confirmation_token)}

  
  def full_name
    "#{self.name} - #{self.last_name}"
  end

  private

  def generate_token(column)
    loop do
      self[column] = SecureRandom.urlsafe_base64
      break unless User.exists?(column => self[column])
    end
  end
  
end
