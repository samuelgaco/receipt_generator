# frozen_string_literal: true

class ReceiptGenerator
  def initialize(items)
    @items = items
  end

  attr_reader :items

  def call 
    print_receipt
  end

  private

  def print_receipt
    list_of_item_prices
    puts "Sales Taxes: #{total_sales_taxes}"
    puts "Total: #{total_price}"
  end

  def list_of_item_prices
    items.each do |item|
      puts "item.pvp: #{item.get_name} #{item.get_quantity * item.get_pvp}"
    end
  end

  def total_sales_taxes
    items.map { |item| item.get_pvp - item.get_net }.sum.round(2)
  end

  def total_price
    items.map { |item| item.get_pvp * item.get_quantity }.sum.round(2)
  end
end
