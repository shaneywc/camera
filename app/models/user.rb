require 'digest'
class User < ActiveRecord::Base

  has_many :products
  has_many :orders, :dependent => :destroy
  attr_accessor :password
  attr_accessible :username, :password, :password_confirmation, :fullname, :email, :phone, :address
  before_save :encrypt_password

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  def self.authenticate(username, password)
    user = find_by_username(username)
    return user if user && user.authenticated?(password)
  end

  def authenticated?(password)
    self.hashed_password == encrypt(password + "ruby_rocks" + self.salt)
  end

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

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
  validates :fullname,
            :length => {:within => 4..20},
            :presence => true
  validates :phone,
            :length => {:within => 10..10},
            :presence => true
  validates :email,
            :presence => true,
            :format   => { :with => email_regex }
  validates :address,
            :length => {:within => 4..70},
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