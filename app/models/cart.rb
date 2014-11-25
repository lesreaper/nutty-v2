class Cart < ActiveRecord::Base
  belongs_to :customer
  has_many :line_items
  has_many :products, through: :line_items


  def subtotal
  	return 0 unless line_items.any?
  	line_items.collect(&:subtotal).inject(:+)
  end

  def total
  	tax			= 0
  	shipping	= 0
  	subtotal
  	return tax + shipping + subtotal
  end

end
