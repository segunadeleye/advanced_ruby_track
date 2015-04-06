class InteractiveProgram

  def get_a_binding
    binding
  end

  def run(code, the_binding)
    eval(code, the_binding)
  end
  
end
