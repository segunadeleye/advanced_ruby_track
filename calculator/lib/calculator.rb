class Calculator
  
  def calculate(operand_1, operator, operand_2)
    eval "#{operand_1} #{operator} #{operand_2}"
  end

end
