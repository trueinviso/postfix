require "./validator"

class ExpressionEvaluator
  attr_accessor :tokens, :stack

  def initialize
    @tokens = []
    @stack = []
  end

  def evaluate(expression)
    @tokens = expression.split(" ")
    execute
  end

  private

  def execute
    while(!tokens.empty?) do
      token = tokens.shift
      evaluate_token(token)
    end
    stack.first
  end

  def digit?(token)
    token =~ /[[:digit:]]/
  end

  def evaluate_token(token)
    if digit?(token)
      stack.push(token.to_i)
    else
      validate(token)
      calculate(token)
    end
  end

  def calculate(operand)
    raise InvalidExpressionError unless stack.size > 1
    right = stack.pop
    left = stack.pop

    result = left.send(operand, right)
    stack.push result
  end

  def validate(token)
    Validator.validate(token)
  end

  class InvalidExpressionError < StandardError; end
end
