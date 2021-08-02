require './lib/item'

RSpec.describe Item do
  describe '#initialize' do
    it 'exists' do
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

      expect(item2).to be_an_instance_of(Item)
    end

    it 'has attributes' do
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

      expect(item2.name).to eq('Apple Pie (Slice)')
      expect(item2.price).to eq(2.50)
    end
  end
end

#
# item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
# #=> #<Item:0x007f9c56740d48...>
#
# item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
# #=> #<Item:0x007f9c565c0ce8...>
#
# item2.name
# #=> "Apple Pie (Slice)"
#
# item2.price
# #=> 2.50
#
# food_truck = FoodTruck.new("Rocky Mountain Pies")
# #=> #<FoodTruck:0x00007f85683152f0...>
#
# food_truck.name
# #=> "Rocky Mountain Pies"
#
# food_truck.inventory
# #=> {}
#
# food_truck.check_stock(item1)
# #=> 0
#
# food_truck.stock(item1, 30)
#
# food_truck.inventory
# #=> {#<Item:0x007f9c56740d48...> => 30}
#
# food_truck.check_stock(item1)
# #=> 30
#
# food_truck.stock(item1, 25)
#
# food_truck.check_stock(item1)
# #=> 55
#
# food_truck.stock(item2, 12)
#
# food_truck.inventory
# #=> {#<Item:0x007f9c56740d48...> => 55, #<Item:0x007f9c565c0ce8...> => 12}
