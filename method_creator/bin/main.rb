require_relative "../lib/method_creator"

puts "Enter method name..."
method_name = gets.chomp

until /^[a-z_]+$/.match(method_name)
  puts "Please enter a valid method name."
  method_name = gets.chomp
end

puts "Enter a single line of code to execute."
method_body = gets.chomp

method_creator = MethodCreator.new(method_name, method_body)
