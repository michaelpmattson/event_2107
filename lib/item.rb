class Item
  attr_reader :name,
              :price

  def initialize(params)
    @name  = params[:name]
    @price = params[:price].delete("$").to_f.round(2)
  end
end
