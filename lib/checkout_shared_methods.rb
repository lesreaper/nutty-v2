 module CheckoutSharedMethods

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

  def bitcoin_total
    bitcoin_rate = HTTParty.get('https://bitpay.com/api/rates').detect { |r| r['code'] == 'USD'}['rate']
    (total * (1.0 /bitcoin_rate)).round(8)
  end

  end