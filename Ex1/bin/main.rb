require_relative "../lib/calculator"

calculator = Calculator.new
result = calculator.calculate 3, :+, 2
puts "Result: #{result}"
