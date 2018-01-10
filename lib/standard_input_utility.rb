require "./lib/expression_evaluator"

module StandardInputUtility
  extend self

  def read
    evaluator = ExpressionEvaluator.new

    begin
      loop do
        print("> ")
        expression = STDIN.gets.chomp
        if quit?(expression)
          ap "Have a good day."
          break
        end
        ap evaluator.evaluate(expression)
      end
    rescue Validator::IllegalArgumentException
      ap "Invalid operand"
    rescue ExpressionEvaluator::InvalidExpressionError
      ap "You have entered an invalid expression"
    rescue StandardError
      ap "There was an error, exiting."
    end
  end

  private

  def quit?(expression)
    expression == "q"
  end
end
