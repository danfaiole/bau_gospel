class User < ActiveRecord::Base
  has_secure_password
  
  validates :name, presence: true, length: { maximum: 255 }
  validates :last_name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, email_format: true, uniqueness: true
  validates :password, confirmation: true, length: { minimum: 6}

  
  def full_name
    "#{self.name} - #{self.last_name}"
  end
end
