require_relative 'lib/item'
require_relative 'lib/receipt_generator'

items = []
receipts = []

Dir.glob('inputs/*.txt').each do |file|
  File.readlines(file).each do |line|
    product_number = line.split(' ').first.to_i
    product_price = line.split(' ').last.to_f
    product_name = line.split(' ')[1..-2].join(' ')
    items << Item.new(product_name, product_price, product_number)
  end
  receipts << ReceiptGenerator.new(items)
  items = []
end

receipts.each do |receipt|
  puts receipt.call
end
