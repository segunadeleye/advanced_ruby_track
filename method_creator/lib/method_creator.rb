class MethodCreator

  puts self

  def initialize(method_name, method_body)
    @method_name = method_name
    @method_body = method_body
    run
  end
  
  def run
    eval("def #{@method_name}\n  #{@method_body}\nend")
    puts method(@method_name).call
  end

end
