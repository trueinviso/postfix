module Validator
  extend self

  def validate(token)
    raise IllegalArgumentException unless valid_operand?(token)
  end

  private

  def valid_operand?(token)
    ["*", "+", "-", "/"].include?(token)
  end

  class IllegalArgumentException < StandardError; end
end
