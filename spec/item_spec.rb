# frozen_string_literal: true

require_relative '../lib/item'

RSpec.describe Item do
  describe 'Item calculation' do
    it 'for exempted items non imported are correct' do
      item_chocolate_bar = Item.new('chocolate bar', 0.85)
      item_book = Item.new('book', 12.49)
      item_packet_of_headache_pills = Item.new('packet of headache pills', 9.75)

      expect(item_chocolate_bar.get_pvp).to eq(0.85)
      expect(item_book.get_pvp).to eq(12.49)
      expect(item_packet_of_headache_pills.get_pvp).to eq(9.75)
    end

    it 'for exempted items that are imported are correct' do
      item_imported_box_of_chocolates = Item.new('imported boxes of chocolates', 10.00)

      expect(item_imported_box_of_chocolates.get_pvp).to eq(10.50)
    end

    it 'for non exempted items non imported are correct' do
      item_music_cd = Item.new('music CD', 15.05)
      expect(item_music_cd.get_pvp).to eq(16.55)
    end

    it 'for non exempted items non imported are correct' do
      item_imported_bottle_of_perfume_1 = Item.new('imported bottle of perfume', 47.50)
      item_imported_bottle_of_perfume_2 = Item.new('imported bottle of perfume', 27.99)

      expect(item_imported_bottle_of_perfume_1.get_pvp).to eq(54.65)
      expect(item_imported_bottle_of_perfume_2.get_pvp).to eq(32.19)
    end
  end

  describe 'Calculations of multiple items' do
    it 'for exempted items that are imported are correct' do
      item_imported_box_of_chocolates_2 = Item.new('imported boxes of chocolates', 11.25)

      expect(item_imported_box_of_chocolates_2.get_pvp * 3).to eq(35.55)
    end
  end
end
