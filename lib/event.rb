class Event
  attr_reader :name,
              :food_trucks

  def initialize(name)
    @name        = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map do |food_truck|
      food_truck.name
    end
  end

  def food_trucks_that_sell(item)
    trucks = []
    @food_trucks.each do |food_truck|
      trucks << food_truck if food_truck.inventory.include?(item)
    end
    trucks
  end

  def sorted_item_list
    items = []
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, quantity|
        items << item.name
      end
    end
    items.uniq.sort
  end

  def total_inventory
    total_inventory = Hash.new { |h, k| h[k] = {quantity: 0, food_trucks: []} }
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, quantity|
        total_inventory[item][:quantity] += food_truck.inventory[item]
        total_inventory[item][:food_trucks] << food_truck
      end
    end
    total_inventory
  end

  def overstocked_items
    too_much = []
    total_inventory.each do |item, details|
      if total_inventory[item][:quantity] > 50 && food_trucks_that_sell(item).count > 1
        too_much << item
      end
    end
    too_much
  end

  def sell(item, quantity)
    if quantity > total_inventory[item][:quantity]
      false
    else
      reduce_stock(item, quantity)
      true
    end
  end

  def reduce_stock(item, quantity)
    @food_trucks.each do |food_truck|
      if food_truck.inventory[item] > 0
        if food_truck.inventory[item] > quantity
          food_truck.inventory[item] -= quantity
        else
          sold = food_truck.inventory[item]
          quantity -= sold
          food_truck.inventory.delete(item)
        end
      end
    end
  end
end
