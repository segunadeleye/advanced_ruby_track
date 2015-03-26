require_relative "../lib/stringlet"

print "Enter string: "
input = gets.chomp

print "Enter string method: "
method_name = gets.chomp

str = Stringlet.new
str.concat(input)

method_obj = str.method(method_name)

number_of_arguments = method_obj.arity

arguments = []

if number_of_arguments == 1
  print "Enter 1 required argument: "
  arguments = gets.chomp
elsif number_of_arguments > 1
  print "Enter #{number_of_arguments} required arguments separated by a comma: "
  arguments = gets.chomp.split(',')
elsif number_of_arguments < 0
  print "Enter the arguments: "
  arguments = gets.chomp.split(',')
end

begin
  puts "Result: #{method_obj.call(*arguments)}"
rescue ArgumentError => error
  puts error.message
end
