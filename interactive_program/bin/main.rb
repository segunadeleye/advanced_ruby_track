require_relative "../lib/interactive_program"

puts "Enter your code. Press blank line to run your code. Enter q to exit."

prog = InteractiveProgram.new
the_binding = prog.get_a_binding
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
    begin
      puts prog.run(code, the_binding)
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    ensure
      code = ""
    end
  else
    code += input
  end
end
