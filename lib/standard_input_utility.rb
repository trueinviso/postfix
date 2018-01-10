require "./lib/expression_evaluator"

module StandardInputUtility
  extend self

  def read
    evaluator = ExpressionEvaluator.new

    begin
      while(true) do
        print("> ")
        expression = STDIN.gets.chomp
        abort("Have a good day.") if quit?(expression)
        ap evaluator.evaluate(expression)
      end
    rescue Validator::IllegalArgumentException
      ap "Invalid operand"
    rescue ExpressionEvaluator::InvalidExpressionError
      ap "You have entered an invalid expression"
    else
      ap "There was an error, exiting."
    end
  end

  private

  def quit?(expression)
    expression == "q"
  end
end
