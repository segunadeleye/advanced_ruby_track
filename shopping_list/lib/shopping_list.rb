class ShoppingList
  
  def initialize
    @shopping_list = Hash.new
  end

  def items(&block)
    instance_eval(&block)
  end

  def add(item, quantity)
    @shopping_list[item] = quantity
  end

  def get_list
    @shopping_list
  end

end
