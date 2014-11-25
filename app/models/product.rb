class Product < ActiveRecord::Base
  validates :title, :sku, :price, presence: true
  validates :price, numericality: true

  has_many :line_items
  has_many :carts, through: :line_items


  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

end
