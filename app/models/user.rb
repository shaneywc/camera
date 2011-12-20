require 'digest'
class User < ActiveRecord::Base
  has_many :products
  attr_accessor :password
  before_save :encrypt_password

  def self.authenticate(username, password)
    user = find_by_username(username)
    return user if user && user.authenticated?(password)
  end

  def authenticated?(password)
    self.hashed_password == encrypt(password)
  end

  validates :username,
:uniqueness => true,
:confirmation => true,
:length => {:within => 4..20},
:presence => true
validates :password,
:confirmation => true,
:length => {:within => 4..20},
:presence => true


  protected
  def encrypt_password
    return if password.blank?
    self.hashed_password = encrypt(password)
  end

  def encrypt(string)
    Digest::SHA1.hexdigest(string)
  end
end