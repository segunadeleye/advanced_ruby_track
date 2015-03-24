require_relative "../lib/shopping_list"

list = ShoppingList.new
list.items do
  add("Toothpaste", 2)
  add("Computer", 1)
end

puts list.get_list
