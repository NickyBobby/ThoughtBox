class User < ActiveRecord::Base
  has_secure_password
  has_many :links
  validates :email, uniqueness: true
  validates :password_confirmation, :presence => true, :if => '!password.nil?'
  validates :password, :presence => { :on => :create }, :confirmation => true
end
