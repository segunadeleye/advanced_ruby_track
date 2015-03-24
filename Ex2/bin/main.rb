require_relative "../lib/interactive_program"

puts "Enter your code. Press Enter to run your code. Enter q to exit."

prog = InteractiveProgram.new
code = ""
prompt = ">> "

loop do
  print prompt
  input = gets
  case input
  when /\Aq\n\z/i 
    break
  when /\A\n\z/
    print prompt
    puts prog.run(code)
    code = ""
  else
    code += input
  end
end
