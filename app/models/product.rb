class Product < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :orders, through: :line_items

  attr_accessible :name, :description, :price, :make, :image

  def self.search(search_query)
    if search_query
      find(:all, :conditions => ['name LIKE ?', "%#{ search_query}%"])
    else
      find(:all)
    end
  end
end
