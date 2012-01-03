require 'digest'
class User < ActiveRecord::Base
  has_one :cart
  has_many :products
  attr_accessor :password
  attr_accessible :username, :password, :password_confirmation
  before_save :encrypt_password

  def self.authenticate(username, password)
    user = find_by_username(username)
    return user if user && user.authenticated?(password)
  end

  def authenticated?(password)
    self.hashed_password == encrypt(password + "ruby_rocks" + self.salt)
  end

  validates :username,
            :uniqueness => {:case_sensitive => false},
            :presence => true,
            :length => {:within => 4..20},
            :presence => true
  validates :password,
            :presence => true,
            :confirmation => true,
            :length => {:within => 4..20},
            :presence => true


  protected
  def encrypt_password
    return if password.blank?
    salt = generate_salt
    self.hashed_password = encrypt(password + "ruby_rocks" + salt)

  end

  def encrypt(string)
    Digest::SHA1.hexdigest(string)
  end

  def generate_salt
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    salt = ""
    1.upto(10) { |i| salt << chars[rand(chars.size-1)] }
    self.salt = salt
  end

end