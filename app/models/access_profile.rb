class AccessProfile < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 255 }
  validates :is_admin, presence: true
end
