class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product

  delegate :price, :title, :sku, to: :product
  delegate :image, to: :product, allow_nil: true

  def subtotal
  	price * quantity
  end
end
