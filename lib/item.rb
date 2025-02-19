# frozen_string_literal: true
require 'byebug'

class Item
  def initialize(name, price, quantity = 1, category = nil)
    @name = name
    @price = price
    @tax = get_tax
    @quantity = quantity
    @category = category
  end

  attr_reader :price, :name, :tax, :quantity, :category

  def get_name
    name
  end

  def get_quantity
    quantity
  end

  def get_pvp
    tax_amount = round_to_nearest_005((price * tax).floor(2))
    
    total = price + tax_amount
    
    total.round(2)
  end
  
  def get_net
    price
  end

  private 

  def get_tax
    tax_to_apply = 0

    tax_to_apply = is_imported ? 0.05 : 0
    tax_to_apply += is_exempted ? 0 : 0.1

    tax_to_apply
  end

  def is_imported
    @name.include?('import')
  end

  def is_exempted
    is_book || is_food|| is_medical_product
  end

  def is_book
    (['book', 'lord of the rings'].any? { |word| @name.include?(word) }) || category == 'book'
  end

  def is_food   
    (['chocolate', 'spaghetti'].any? { |word| @name.include?(word) }) || category == 'food'
  end

  def is_medical_product
    (['pill', 'medicine'].any? { |word| @name.include?(word) }) || category == 'medical'
  end

  def round_to_nearest_005(number)
    (number * 20).ceil / 20.0
  end
end
